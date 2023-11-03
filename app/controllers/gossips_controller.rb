class GossipsController < ApplicationController

  def show
    @gossip = Gossip.find(params[:id])
  end

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(content: params[:content], title: params[:title], user_id: User.all.sample.id)
    @gossip.user = current_user
    if @gossip.save
      flash[:success] = "Xoxo Gossip saved successfully"
      redirect_to "/"
    else
      flash[:alert] = "Veuillez vous connecter chef"
      redirect_to "/"
    end 
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip = Gossip.find_by(id: params[:id])
    @gossip.update(gossip_params)

  end

  def destroy
    @gossip = Gossip.find_by(id: params[:id])
    @gossip.destroy
    flash[:success] = "Ouppsss Gossip supprimé "
    redirect_to "/"
  end

  def like
  @gossip = Gossip.find(params[:id])
  current_user.Like.create(gossip: params[:gossip])
  redirect_to gossips_path, notice: "oh u like it hun"
  end

  def dislike
    @gossip = Gossip.find(params[:id])
    current_user.Like.find(gossip: params[:gossip]).destroy
    redirect_to gossips_path, notice: "Ah finalement non ?"

  end

  private
  def gossip_params 
    gossip_params = params.require(:gossip).permit(:title, :content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  def authenticate_author
    @gossip = Gossip.find(params[:id])
    unless @gossip.user == current_user
      flash[:danger] = "You are not allowed to edit this gossip."
      redirect_to gossips_path
    end
  end

end
