# frozen_string_literal: true

class ProFootballReference::StatTable
  PfrRushingAndReceiving = PfrReceivingAndRushing
  def initialize(table, player_id)
    @table = table
    @player = player_id
  end

  def update_player_data
    @table.css('tbody tr').each do |stats|
      next if stats['reason']
      save_data(parse_row(stats))
    end
  end

  def table_type
    @table.css('table').first.attributes['id'].value
  end

  def table_class
    @table_class ||= ('pfr_' + table_type)
                     .camelcase
                     .singularize
                     .safe_constantize || PfrReceivingAndRushing
  end

  private

  def save_data(data)
    season_stat = table_class.find_or_initialize_by(
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
