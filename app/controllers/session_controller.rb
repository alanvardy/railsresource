class SessionController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin_params = params.require(:admin).permit(:username, :password)

    @admin = Admin.new
    @admin.username = admin_params[:username]
    @admin.password = admin_params[:password]

    if @admin.login_valid?
      session[:admin] = true
      flash[:success] = 'You have logged in'
      redirect_to root_path
    else
      @admin.password = nil
      flash[:notice] = 'Sorry, wrong credentials'
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end

  def dark
    session[:dark] = true
    redirect_back(fallback_location: root_path)
  end

  def light
    session[:dark] = nil
    redirect_back(fallback_location: root_path)
  end
end
