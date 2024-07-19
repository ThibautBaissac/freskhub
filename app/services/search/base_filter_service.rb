class Search::BaseFilterService
  def initialize(filter_params:, includes:, user:)
    @params = filter_params
    @includes = includes
    @user = user
  end

  def call
    raise(NotImplementedError)
  end
end
