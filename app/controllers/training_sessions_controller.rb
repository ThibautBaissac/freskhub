class TrainingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    training_sessions = TrainingSession.all
                                       .includes(:language, :country, category: :fresk)
                                       .order(start_at: :desc)
    @pagy, @records = pagy(training_sessions)
    @decorated_records = @records.map(&:decorate)
    @geocoded_records = @records.geocoded
  end

  def show
    @training_session = TrainingSession.find_by_uuid(params[:id]).decorate
  end
end
