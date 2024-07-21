class Administration::UsersController < ApplicationController
  def index
    authorize(%i[administration user], :index?)
    @geocoded_users = User.gecoded
  end
end
