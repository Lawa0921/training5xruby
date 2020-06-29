class Tag < ApplicationRecord
  has_many :mission_tags
  has_many :missions, through: :mission_tags, dependent: :destroy
  validates :name, presence: true,
                   uniqueness: true
end
