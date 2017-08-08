# frozen_string_literal: true

class ProFootballReference::PlayerData
  HOME = 'http://www.pro-football-reference.com/'.freeze

  def initialize(sub_url)
    page = Nokogiri.parse(HTTParty.get(HOME + sub_url))

    @player_name = page.css('h1').inner_text.split(' ')
    @data_spans = page.css('div#meta div:not(.media-item) span')
    @data_headers = page.css('div#meta div:not(.media-item) p strong')

    @stats_table = ProFootballReference::StatTable.new(
      page.css('.stats_table'), player.id
    )
  end

  def parse_player_data
    @stats_table.update_player_data
  end

  def player
    @player ||= Player.create_or_update(player_data)
  end

  def player_data
    {
      first_name: @player_name.first,
      last_name: @player_name.last,
      position: position,
      hand: throws,
      height: height,
      current_team: current_team,
      dob: dob,
      birth_city: birth_data[:birth_city],
      birth_state: birth_data[:birth_state],
      college: college,
      wgt_av: av_rank[:wgt_av],
      wgt_av_rank: av_rank[:wgt_av_rank]
    }
  end

  def self.scrape_active_data_stats
    ('A'..'Z').each do |letter|
      self.get_data_by_leter(letter)
    end
  end

  def self.get_data_by_leter(letter)
    puts "Scraping player data. Letter: \"#{letter}\""
    player_urls(letter).each do |url|
      new(url).parse_player_data
      sleep 0.25
    end
    $stdout.flush
  end

  def self.player_urls(start_letter)
    page = HTTParty.get(
      HOME + "/players/#{start_letter}/"
    )
    parsed_page = Nokogiri.parse(page)
    parsed_page.css('#div_players p b a').map(&:values).flatten
  end

  private

  def position
    @data_headers.drill(
      [:text_includes, 'Position'], :first, :next,
      :text, :strip, [:tr, ': *', '']
    )
  end

  def throws
    @data_headers.drill(
      [:text_includes, 'Throws'], :first, :next, :text, :strip
    )
  end

  def height
    @data_spans.drill([:attr_equals, 'itemprop', 'height'], :text)
  end

  def weight
    @data_spans.drill(
      [:attr_equals, 'itemprop', 'weight'], :text, [:tr, 'lb', '']
    )
  end

  def current_team
    @data_spans.drill(
      [:attr_equals, 'itemprop', 'affiliation'], :text
    )
  end

  def dob
    date = @data_spans.drill(
      [:attr_equals, 'itemprop', 'birthDate'], :first, [:[], 'data-birth']
    )

    Date.strptime(date, '%Y-%m-%d') if date
  end

  def birth_data
    @birth_data ||= begin
      place = @data_spans.drill(
        [:attr_equals, 'itemprop', 'birthPlace'], :text, :strip, :squish,
        [:gsub, 'in', ''], [:split, ', ']
      ) || []

      { birth_city: place.first, birth_state: place.last }
    end
  end

  def college
    @data_headers.drill(
      [:text_includes, 'College'], :first, :next_element, :text
    )
  end

  def av_rank
    @av_rank ||= begin
      ranking = @data_headers.drill(
        [:text_includes, 'Weighted Career AV (100-95-...)'], :first, :next,
        :text, :strip, [:scan, /\d+/]
      )
      { wgt_av: ranking.first, wgt_av_rank: ranking[1] }
    end
  end
end
