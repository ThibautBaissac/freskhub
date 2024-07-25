class Searches::TabsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @tabs, @active_tab = Search::TabPresenter.new(tab: params[:tab]).call
    respond_to(&:turbo_stream)
  end
end
