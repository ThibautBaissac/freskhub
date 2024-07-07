class FresksController < ApplicationController
  def index
    @fresks = Fresk.all.order(created_at: :asc)
  end

  def show
    @fresk = Fresk.find(params[:id])
  end
end
