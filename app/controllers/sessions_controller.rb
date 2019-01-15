
class SessionsController < ApplicationController
  
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    session[:user_id] = @user.id
    render 'welcome/home'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end

SESSION NO  N CONTROLLERS

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
