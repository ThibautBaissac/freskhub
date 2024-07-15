class TrainingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    training_sessions = TrainingSession.all
                                       .includes(:language, :country, category: :fresk)
                                       .order(start_at: :desc)
    @pagy, @training_sessions = pagy(training_sessions)
    @decorated_training_sessions = @training_sessions.map(&:decorate)
  end

  def show
    @training_session = TrainingSession.find_by_uuid(params[:id])
  end
end
