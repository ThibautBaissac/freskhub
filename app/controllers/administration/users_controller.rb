class Administration::UsersController < ApplicationController
  def index
    authorize(%i[administration user], :index?)
    @geocoded_users = User.in_same_fresk_as(current_user).gecoded
  end
end
