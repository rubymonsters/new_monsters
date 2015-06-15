class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "admin", password: PASSWORD 

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(already_notified: :asc)
  end

  # GET /users/1
  # GET /users/1.json
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_notifications
    params[:user_ids].each do |id|
      user = User.find(id)
      UserMailer.notification_email(user).deliver
      user.update(already_notified: true)
    end
    redirect_to users_url, notice: 'Emails were sent :)'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :location, :twitter_handle, :female, :beginner, :already_notified)
    end
end
