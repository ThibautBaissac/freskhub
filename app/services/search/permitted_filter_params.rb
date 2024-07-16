class Search::PermittedFilterParams
  def initialize(model:, params:)
    @model = model
    @params = params
  end

  def call
    case @model.name
    when "TrainingSession"
      @params.permit(:language_id, :country_id, :category_id, :fresk_id, :start_at, :end_at,
                     :role)
    end
  end
end
