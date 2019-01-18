class FacebookUsersController < ApplicationController
  
  def create
    @user = FacebookUser.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    session[:user_id] = @user.id
    redirect_to root_url
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end
