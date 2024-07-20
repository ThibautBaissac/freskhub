class Administration::ComponentsController < ApplicationController
  def index
    authorize(%i[administration component], :index?)
  end
end
