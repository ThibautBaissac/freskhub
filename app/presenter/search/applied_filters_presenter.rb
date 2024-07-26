class Search::AppliedFiltersPresenter
  def initialize(filter_params:)
    @filter_params = filter_params.to_h
  end

  def call
    @filter_params.reject! { |_, value| value.blank? }
    filter_strategies.each_with_object({}) do |strategy, filters|
      filters.merge!(strategy.apply(@filter_params))
    end
  end

  private

  def filter_strategies
    [
      Search::LanguageFilter.new,
      Search::CountryFilter.new,
      Search::CategoryFilter.new,
      Search::FreskFilter.new,
      Search::RoleFilter.new,
      Search::QueryFilter.new
    ]
  end
end
