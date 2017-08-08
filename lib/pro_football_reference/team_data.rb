# frozen_string_literal: true

class ProFootballReference::TeamData
  class << self
    URL = 'http://www.pro-football-reference.com/teams/'.freeze

    def scrape_team_data
      page = Nokogiri.parse(HTTParty.get(URL))
      page.css('table#teams_active tbody tr:not(.partial_table)').map do |row|
        parse_row(row)
      end
    end

    def parse_row(row)
      stats = { 'team_name' => row.css('th').first.inner_text }
      row.css('td').each do |td|
        stats[td.attributes['data-stat'].value] = td['csk'] || td.inner_text
      end
      stats
    end
  end
end
