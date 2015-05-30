class SignupController < ApplicationController

  # GET /signup
  def new
    # default: render :new (view) doesn't have to be defined.
    @user = User.new
  end

  # POST /signup
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to signup_confirmation_path
    else
      render :new
    end
  end

  # GET /signup/confirmation
  def confirmation
    render :confirmation
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :location, :twitter_handle, :female, :beginner, :already_notified)
    end

end
