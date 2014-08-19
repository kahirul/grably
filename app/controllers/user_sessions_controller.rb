class UserSessionsController < ApplicationController
  load_and_authorize_resource

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new params[:user_session]
    if @user_session.save
      flash[:notice] = 'Login succeeded'

      redirect_to root_path
    else
      flash[:alert] = 'Login failed.'
      render :new
    end
  end

  def destroy
    current_user_session && current_user_session.destroy
    flash[:notice] = 'Logout succeeded'
    redirect_to root_path
  end
end
