class ProFootballReferencesController < ApplicationController
  def new
  end

  def create
    PfrPlayerDataWorker.perform_async(params[:scraper])
    redirect_to pro_football_references_path
  end

  def destroy
  end

  def index; end
end
