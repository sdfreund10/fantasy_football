class PfrPlayerDataWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(method)
    send(method.to_sym)
  end

  def team_data
    ProFootballReference::TeamData.scrape_team_data
  end

  def player_data
    ProFootballReference::PlayerData.scrape_all_data
  end

  def season_stats
    ProFootballReference::SeasonStat.scrape_data
  end
end
