class GossipsController < ApplicationController

  def gossip
    @gossip = Gossip.find(params[:id])
  end

  def allgossips
    @gossips = Gossip.all
  end
end
