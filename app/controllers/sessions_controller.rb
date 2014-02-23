class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:session][:identifier],
      params[:session][:password]
      )

    if @user
      login_user!(@user)
      flash[:success] = "Logged in!"
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    @user = current_user

    logout_user!(@user)
    redirect_to root_url
  end

end
