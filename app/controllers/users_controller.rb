class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :set_authorization, only: %i[show edit update]

  def index
    @model = User
    @records = @model.all
    @geocoded_records = @records.in_same_fresk_as(current_user).geocoded
  end

  def show
    @tabs, @active_tab = Users::TabPresenter.new(user: @user, tab: params[:tab]).call
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

  def set_authorization
    authorize(@user)
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :description, :locale, :latitude, :longitude, :address,
                                 :city, :state, :postal_code, :country_id)
  end
end
