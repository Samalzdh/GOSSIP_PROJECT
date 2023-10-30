class Tag < ApplicationRecord
  has_many :gossips, through: :inter_tag_gossips

end
