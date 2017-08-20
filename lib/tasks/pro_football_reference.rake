namespace :pro_football_reference do
  task scrape_active_player_data: :environment do
    PfrPlayerDataWorker.perform_async
    # ProFootballReference::PlayerData.scrape_active_data_stats
  end

  task scrape_player_data: :environment do
    ProFootballReference::PlayerData.scrape_all_data
  end
end
