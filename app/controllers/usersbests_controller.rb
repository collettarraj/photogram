class UsersbestsController < ApplicationController
  before_action :current_user_must_be_usersbest_users, only: [:edit, :update, :destroy] 

  before_action :set_usersbest, only: [:show, :edit, :update, :destroy]

  # GET /usersbests
  def index
    @usersbests = Usersbest.all
  end

  # GET /usersbests/1
  def show
  end

  # GET /usersbests/new
  def new
    @usersbest = Usersbest.new
  end

  # GET /usersbests/1/edit
  def edit
  end

  # POST /usersbests
  def create
    @usersbest = Usersbest.new(usersbest_params)

    if @usersbest.save
      message = 'Usersbest was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @usersbest, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /usersbests/1
  def update
    if @usersbest.update(usersbest_params)
      redirect_to @usersbest, notice: 'Usersbest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /usersbests/1
  def destroy
    @usersbest.destroy
    message = "Usersbest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to usersbests_url, notice: message
    end
  end


  private

  def current_user_must_be_usersbest_users
    set_usersbest
    unless current_user == @usersbest.users
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_usersbest
      @usersbest = Usersbest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usersbest_params
      params.require(:usersbest).permit(:dishes_id, :venue_id, :users_id)
    end
end
