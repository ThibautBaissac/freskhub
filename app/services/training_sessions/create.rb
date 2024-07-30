class TrainingSessions::Create
  def initialize(training_session_params:, current_user:)
    @training_session_params = training_session_params
    @current_user = current_user
  end

  def call
    training_session = TrainingSession.new(@training_session_params)
    training_session.uuid = SecureRandom.uuid

    ActiveRecord::Base.transaction do
      training_session.save!
      training_session.editors.create!(user: @current_user)
    end

    training_session
  rescue ActiveRecord::RecordInvalid => e
    training_session.errors.add(:base, e.message)
    training_session
  end
end
