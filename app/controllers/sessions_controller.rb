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
      # REDIRECT GOES HERE - throws error for now
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])

    logout_user!(@user)
    redirect_to new_session_url
  end

end
