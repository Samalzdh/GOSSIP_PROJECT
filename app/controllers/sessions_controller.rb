class SessionsController < ApplicationController

  
  def create
    user = User.find_by(email: params[:email])  # cherche s'il existe un utilisateur en base avec l’e-mail
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', flash: { success: "Bien connecté" }
    else 
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end



  def destroy
    session.delete(:user_id)
    redirect_to '/', flash: { success: "A Bientot" }
  end

end


