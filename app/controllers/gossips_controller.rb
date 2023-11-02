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
    @gossip.user = User.find_by(id: session[:user_id])
    if @gossip.save
      flash[:success] = "Xoxo Gossip saved successfully"
      redirect_to "/"
    else
      flash[:alert] = "essaie encore"
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

  private
  def gossip_params 
    gossip_params = params.require(:gossip).permit(:title, :content)
  end
end
