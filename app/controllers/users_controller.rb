class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @geocoded_users = User.gecoded
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to(user_path(@user.uuid), notice: t("users.update.success")) }
        format.turbo_stream
      end
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  private

  def set_user
    @user = User.find_by_uuid(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :description, :locale, :latitude, :longitude, :address,
                                 :city, :state, :postal_code, :country_id)
  end
end
