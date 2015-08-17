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


# NOT WORKING, but also giving no error!
  # GET /signup/male
  def male
    @user = User.new(female: params[:female])

    @user.female = false

    if @user.save
    # if @user.female = false
      redirect_to signup_male_path
    else
      redirect_to signup_confirmation_path
    end
  end

# NOT WORKING, but also giving no error!
  # GET /signup/nonbeginner
  def nonbeginner
    @user = User.new(user: params[:beginner])

    if @user.save false
      redirect_to signup_nonbeginner_path
    else
      render :confirmation
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :location, :twitter_handle, :female, :beginner, :already_notified)
    end

end
