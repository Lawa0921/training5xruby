class Tag < ApplicationRecord
  has_many :missions, through: :mission_tag
  validates :name, presence: true,
                   uniqueness: true
end
