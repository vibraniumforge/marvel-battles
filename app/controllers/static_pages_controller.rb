class StaticPagesController < ApplicationController
    
  # before_action :require_login
  
  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end