class Tag < ApplicationRecord
  has_many :missions, through: :mission_tag
end
