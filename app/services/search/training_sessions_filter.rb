class Search::TrainingSessionsFilter
  def initialize(training_sessions, params, user)
    @training_sessions = training_sessions
    @params = params
    @user = user
  end

  def call
    @training_sessions = filter_by_language
    @training_sessions = filter_by_country
    @training_sessions = filter_by_category
    @training_sessions = filter_by_fresk
    @training_sessions = filter_by_start_at
    @training_sessions = filter_by_end_at
    @training_sessions = filter_by_role
  end

  private

  def filter_by_language
    return @training_sessions unless @params[:language_id].present?

    @training_sessions.where(language_id: @params[:language_id])
  end

  def filter_by_country
    return @training_sessions unless @params[:country_id].present?

    @training_sessions.where(country_id: @params[:country_id])
  end

  def filter_by_category
    return @training_sessions unless @params[:category_id].present?

    @training_sessions.where(training_session_category_id: @params[:category_id])
  end

  def filter_by_fresk
    return @training_sessions unless @params[:fresk_id].present?

    @training_sessions.joins(:category).where(training_session_categories: {fresk_id: @params[:fresk_id]})
  end

  def filter_by_start_at
    return @training_sessions unless @params[:start_at].present?

    @training_sessions.where("start_at >= ?", @params[:start_at])
  end

  def filter_by_end_at
    return @training_sessions unless @params[:end_at].present?

    @training_sessions.where("end_at <= ?", @params[:end_at])
  end

  def filter_by_role
    return @training_sessions unless @params[:role].present?

    case @params[:role]
    when "editor"
      @training_sessions.by_user_as_editor(@user)
    when "facilitator"
      @training_sessions.by_user_as_facilitator(@user)
    when "participant"
      @training_sessions.by_user_as_participant(@user)
    else
      @training_sessions
    end
  end
end
