class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_name = @user.first_name + ' ' + @user.last_name
  end

  
end