# frozen_string_literal: true

class ProFootballReference::SeasonStat
  ALLOWED_TABLES = ["passing", "rushing", "receiving", "defense", "kicking", "returns", "scoring", "fantasy"]
  HOME = "https://www.pro-football-reference.com/".freeze
  def initialize(year, type)
    @year = year
    url = HOME + "/years/#{year}/#{type}.htm"
    page = Nokogiri.parse(HTTParty.get(url))
    stats_table = ProFootballReference::StatTable.new(
      page.css('.stats_table')
    )
    @data = stats_table.table_data
    @table_type = stats_table.table_class
  end

  def process_table
    @data.each do |row|
      process_row(row)
    end
  end

  def process_row(row)
    player = find_player(row)
    if player.nil?
      puts "Skipping #{row[player]}"
      return
    end
    season_stat = @table_type.find_or_initialize_by(player_id: player.id, year: @year)
    season_stat.update(
      row.merge("year" => @year).slice(*@table_type.column_names)
    )
  end

  def find_player(data)
    player_name = player_name(data["player"])
    player = Player.find_by(
      first_name: player_name.first,
      last_name: player_name.last,
      position: (data["pos"] || data["fantasy_pos"]).upcase
    )
  end

  def player_name(name)
    name.gsub(/\*|\+/, "").split(" ")
  end


  def self.get_yearly_data(years, type)
    unless ALLOWED_TABLES.include? type
      raise "Please choose a valid table"
    end

    [*years].each do |year|
      new(year, type).process_table
      sleep 1
    end
  end

  def scrape_data
    ALLOWED_TABLES.each do |table|
      get_yearly_data(("1980".."2016").to_a, table)
    end
  end
end