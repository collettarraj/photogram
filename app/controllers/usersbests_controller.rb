class UsersbestsController < ApplicationController
  before_action :current_user_must_be_usersbest_users,
                only: %i[edit update destroy]

  before_action :set_usersbest, only: %i[show edit update destroy]

  def index
    @q = Usersbest.ransack(params[:q])
    @usersbests = @q.result(distinct: true).includes(:users, :dishes,
                                                     :venue).page(params[:page]).per(10)
  end

  def show; end

  def new
    @usersbest = Usersbest.new
  end

  def edit; end

  def create
    @usersbest = Usersbest.new(usersbest_params)

    if @usersbest.save
      message = "Usersbest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @usersbest, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @usersbest.update(usersbest_params)
      redirect_to @usersbest, notice: "Usersbest was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @usersbest.destroy
    message = "Usersbest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to usersbests_url, notice: message
    end
  end

  private

  def current_user_must_be_usersbest_users
    set_usersbest
    unless current_user == @usersbest.users
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_usersbest
    @usersbest = Usersbest.find(params[:id])
  end

  def usersbest_params
    params.require(:usersbest).permit(:dishes_id, :venue_id, :users_id)
  end
end
