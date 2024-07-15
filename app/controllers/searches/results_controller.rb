class Searches::ResultsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    return unless params.key?(:training_session)

    training_sessions = TrainingSession.all.includes(:language, :country, category: :fresk)
    training_sessions = Search::Filter.new(training_sessions, filter_params, current_user).call
    @pagy, @training_sessions = pagy(training_sessions.order(start_at: :desc))
    @decorated_training_sessions = @training_sessions.map(&:decorate)
    render "training_sessions/index"
  end

  private

  def filter_params
    params.require(:training_session).permit(:language_id, :country_id, :category_id, :fresk_id, :start_at, :end_at,
                                             :role)
  end
end
