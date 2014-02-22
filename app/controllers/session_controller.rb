class SessionController < ApplicationController

  def new
    render :login
  end

  def create
    @user = User.find_by_parameters(
      params[:session][:identifier]
      params[:session][:password]
      )

    if @user
      login_user!
      flash[:success] = "Logged in!"
      # REDIRECT GOES HERE
    else
      flash[:error] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

  end
end
