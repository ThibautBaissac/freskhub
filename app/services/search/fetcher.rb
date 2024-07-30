class Search::Fetcher
  def initialize(model:, filter_params:, includes:, user:)
    @model = model
    @params = filter_params
    @includes = includes
    @user = user
  end

  def call
    case @model.name
    when "TrainingSession"
      Search::TrainingSessionsFilter.new(filter_params: @params, includes: @includes, user: @user).call
    when "User"
      Search::UsersFilter.new(filter_params: @params, includes: @includes, user: @user).call
    else
      raise(ArgumentError, "Unsupported model type")
    end
  end
end
