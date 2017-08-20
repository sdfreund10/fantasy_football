# frozen_string_literal: true

class ProFootballReference::StatTable
  def initialize(table, player_id = nil)
    @table = table
    @player = player_id
  end

  def update_player_data
    @table.css('tbody tr').each do |stats|
      next if stats['reason']
      data = parse_row(stats)
      save_data(data.slice("av", "year"), PfrApproximateValueStat)
    end
  end

  def table_data
    @table.css('tbody tr:not(.thead)').inject([]) do |data, stats|
      data << parse_row(stats)
      data
    end
  end

  def table_type
    @table.css('table').first.attributes['id'].value
  end

  def table_class
    @table_class ||= ('pfr_' + table_type.singularize + "_stat")
                     .camelcase
                     .safe_constantize || PfrReceivingAndRushingStat
  end

  private

  def save_data(data, klass)
    season_stat = klass.find_or_initialize_by(
      player_id: @player, year: data['year']
    )

    season_stat.update(data)
  end

  def parse_row(row)
    stats = { 'year' => row.css('th').inner_text }
    row.css('td').each do |td|
      stats[td.attributes['data-stat'].value] = td.inner_text
    end
    stats
  end
end
