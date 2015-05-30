class SignupController < ApplicationController

  # GET /signup
  def new
    @user = User.new   # default: render :new (view) muss nicht extra definiert werden
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
  

  def confirmation
    render :confirmation
    #'Thanks for signing up!\nWe will notify you when we are about to set up
    #  a new beginners group.'  --> put this in view template
  end

  private    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :location, :twitter_handle, :female, :beginner, :already_notified)
    end

end

# Next: build new view and cofirmation view, put them in signup views directory