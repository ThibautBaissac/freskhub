class Users::TabsController < ApplicationController
  before_action :set_user

  def index
    @active_tab = case params[:tab]
                  when "sessions" then "sessions"
                  when "participants" then "participants"
                  else "profile"
                  end
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
