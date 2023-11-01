class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @gossips = @user.gossips

  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      age: params[:age],
      description: params[:description],
      city: params[:city]
    )
    if @user.save
      flash[:success] = "Utilisateur bien créé"
      redirect_to show_user_path(@user) # Assuming you have a show_user route
    else
      flash[:alert] = "Utilisateur non créé"
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Utilisateur mis à jour"
      redirect_to show_user_path(@user) # Assuming you have a show_user route
    else
      flash[:alert] = "Mise à jour de l'utilisateur échouée"
      redirect_to edit_user_path(@user) # Assuming you have an edit_user route
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Utilisateur supprimé"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :city)
  end
end
