class Tag < ApplicationRecord
  has_many :missions, through: :mission_tag, dependent: :destroy
  validates :name, presence: true,
                   uniqueness: true
end
