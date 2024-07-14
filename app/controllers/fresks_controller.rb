class FresksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @fresks = Fresk.all.order(created_at: :asc).map(&:decorate)
  end

  def show
    @fresk = Fresk.find(params[:id]).decorate
    @training_sessions = @fresk.training_sessions
                               .order(start_at: :desc)
                               .includes(:category, :language, :country, category: :fresk)
                               .map(&:decorate)
  end
end
