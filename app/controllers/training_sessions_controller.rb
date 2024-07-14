class TrainingSessionsController < ApplicationController
  def index
    training_sessions = case params[:role]
                        when "as_facilitator"
                          TrainingSession.by_user_as_facilitator(User.last)
                        when "as_editor"
                          TrainingSession.by_user_as_editor(User.last)
                        when "as_participant"
                          TrainingSession.by_user_as_participant(User.first)
                        else
                          TrainingSession.all
                        end
    training_sessions = training_sessions
                        .order(start_at: :desc)
                        .includes(:category, :language, :country)
    @pagy, @training_sessions = pagy(training_sessions)
    @decorated_training_sessions = @training_sessions.map(&:decorate)
  end

  def show
    @training_session = TrainingSession.find_by_uuid(params[:id])
  end
end
