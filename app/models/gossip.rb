class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :inter_tag_gossips
end
