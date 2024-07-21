class Searches::ResultsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    model = params[:model].classify.constantize
    permitted_filter_params = Search::PermittedFilterParams.new(model:, params:).call
    associated_includes = Search::AssociatedIncludes.new(model:).call
    records = Search::Fetcher.new(model:,
                                  filter_params: permitted_filter_params,
                                  includes: associated_includes,
                                  user: current_user).call

    @pagy, @records = pagy(records.order(start_at: :desc))
    @decorated_records = @records.map(&:decorate)
    @geocoded_records = @records.geocoded
    @applied_filters = Search::AppliedFiltersPresenter.new(filter_params: permitted_filter_params).call

    render("#{model.name.underscore.pluralize}/index")
  end
end
