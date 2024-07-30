class FresksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @fresks = Fresk.all
                   .order(created_at: :asc)
                   .limit(10)
                   .map(&:decorate)
  end

  def show
    @fresk = Fresk.find(params[:id]).decorate
    @training_sessions = TrainingSessions::Select.new(user: current_user, fresk: @fresk).call
    @training_sessions = @training_sessions.limit(10)
  end
end
