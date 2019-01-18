class SessionController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
  end

  def destroy
    if current_user
        session.delete :user_id
        redirect_to root_url
    end
  end


end
