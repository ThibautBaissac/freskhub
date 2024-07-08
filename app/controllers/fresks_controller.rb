class FresksController < ApplicationController
  def index
    @fresks = Fresk.all.order(created_at: :asc)
  end

  def show
    @fresk = Fresk.find(params[:id])
    @training_sessions = @fresk.training_sessions
                               .order(start_at: :desc)
                               .includes(:category, :language, :country)
                               .map(&:decorate)
  end
end
