class TrainingSessions::Update
  def initialize(training_session:, training_session_params:)
    @training_session = training_session
    @training_session_params = training_session_params
  end

  def call
    @training_session.assign_attributes(@training_session_params)
    @training_session.save
    @training_session
  end
end
