class TrainingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_training_session, only: %i[show edit update]

  def index
    @model = TrainingSession
    training_sessions = @model.all
                              .includes(:language, :country, category: :fresk)
                              .order(start_at: :desc)
    @pagy, @records = pagy(training_sessions)
    @geocoded_records = @records.geocoded
  end

  def show
    authorize(@training_session)
  end

  def new
    authorize(TrainingSession)
    @training_session = TrainingSession.new
  end

  def create
    service = TrainingSessions::Create.new(training_session_params:, current_user:)
    @training_session = service.call
    if @training_session.persisted?
      redirect_to(@training_session, notice: "Training session was successfully created.")
    else
      flash[:alert] = @training_session.errors.full_messages.to_sentence
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    authorize(@training_session)
  end

  def update
    @training_session = TrainingSession.find_by_uuid(params[:id])
    authorize(@training_session)
    service = TrainingSessions::Update.new(training_session: @training_session, training_session_params:)
    @training_session = service.call
    if @training_session.errors.empty?
      redirect_to(@training_session, notice: "Training session was successfully updated.")
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  private

  def set_training_session
    @training_session = TrainingSession.find_by_uuid(params[:id])
  end

  def training_session_params
    params.require(:training_session).permit(:participants_message, :facilitators_message, :start_at, :end_at,
                                             :max_participants, :connexion_url, :published, :language_id, :country_id,
                                             :training_session_category_id, :latitude, :longitude)
  end
end
