class User < ApplicationRecord
  has_secure_password
  has_many :missions, dependent: :destroy
  enum authority: ["user", "admin"]
  validates :name, presence: true,
                   uniqueness: true,
                   length: {maximum: 32}
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  validates :password, presence: true,
                       confirmation: true, length: { minimum: 4 }
end
