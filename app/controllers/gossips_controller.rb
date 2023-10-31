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
    if @gossip.save
      flash[:success] = "Xoxo Gossip saved successfully"
      redirect_to "/"
    else
      flash[:alert] = "essaie encore"
      redirect_to "/"
    end 
  end
end
