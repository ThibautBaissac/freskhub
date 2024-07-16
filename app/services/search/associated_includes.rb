class Search::AssociatedIncludes
  def initialize(model:)
    @model = model
  end

  def call
    case @model.name
    when "TrainingSession"
      [:language, :country, {category: :fresk}]
    else
      []
    end
  end
end
