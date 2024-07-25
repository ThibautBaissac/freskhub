class Users::TabsController < ApplicationController
  before_action :set_user

  def index
    @tabs, @active_tab = Users::TabPresenter.new(user: @user, tab: params[:tab]).call
    respond_to do |format|
      format.turbo_stream
      format.html { render("users/show") }
    end
  end

  private

  def set_user
    @user = User.find_by_uuid(params[:user_id])
  end
end
