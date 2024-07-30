class TrainingSessions::Select
  def initialize(user:, fresk: nil)
    @user = user
    @fresk = fresk
  end

  def call
    training_sessions = TrainingSession.upcoming
    training_sessions = if @user.superadmin
                          training_sessions.all
                        else
                          training_sessions.published
                        end

    if @fresk.present?
      training_sessions = training_sessions.joins(:category).where(training_session_categories: {fresk: @fresk})
    end

    training_sessions.includes(:language, :country, category: :fresk)
                     .order(start_at: :desc)

    training_sessions
  end
end
