class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :inter_tag_gossips
  validates :content, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
end
