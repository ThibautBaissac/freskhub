class TrainingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    training_sessions = case params[:role]
                        when "as_facilitator"
                          TrainingSession.by_user_as_facilitator(current_user)
                        when "as_editor"
                          TrainingSession.by_user_as_editor(current_user)
                        when "as_participant"
                          TrainingSession.by_user_as_participant(current_user)
                        else
                          TrainingSession.all
                        end
    training_sessions = training_sessions
                        .order(start_at: :desc)
                        .includes(:category, :language, :country, category: :fresk)
    @pagy, @training_sessions = pagy(training_sessions)
    @decorated_training_sessions = @training_sessions.map(&:decorate)
  end

  def show
    @training_session = TrainingSession.find_by_uuid(params[:id])
  end
end
