# frozen_string_literal: true

class WorkersController < ApplicationController
  def index
    active_workers = Sidekiq::Workers.new.map do |_proc, _tid, data|
      {
        worker: data["payload"]["class"],
        enqueued_at: Time.at(data["payload"]["enqueued_at"]).to_s,
        created_at: Time.at(data["payload"]["created_at"]).to_s,
        elapsed_at: (Time.now - Time.at(data["run_at"])).round
      }
    end
    render json: active_workers
  end
end
