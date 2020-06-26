class User < ApplicationRecord
  has_secure_password
  has_many :missions, dependent: :destroy
  before_destroy :check_last_admin
  enum authority: ["user", "admin"]
  validates :name, presence: true,
                   uniqueness: true,
                   length: {maximum: 32}
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  validates :password, presence: true,
                       confirmation: true, length: { minimum: 4 }

  private
  def check_last_admin 
    if User.admin.size == 1 && self.authority == "admin"
      errors.add(:base, I18n.t("users.last_admin"))
      throw :abort
    end
  end
end
