class Searches::ResultsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @model = params[:model].classify.constantize
    permitted_filter_params = Search::PermittedFilterParams.new(model: @model, params:).call
    associated_includes = Search::AssociatedIncludes.new(model: @model).call
    records = Search::Fetcher.new(model: @model,
                                  filter_params: permitted_filter_params,
                                  includes: associated_includes,
                                  user: current_user).call

    @pagy, @records = pagy(records)
    @decorated_records = @records.map(&:decorate)
    @geocoded_records = @records.geocoded
    @applied_filters = Search::AppliedFiltersPresenter.new(filter_params: permitted_filter_params).call

    render(render_path)
  end

  private

  def render_path
    case @model.name
    when "TrainingSession"
      "training_sessions/index"
    when "User"
      "users/index"
    end
  end
end
