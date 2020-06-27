class User < ApplicationRecord
  has_secure_password
  has_many :missions, dependent: :destroy
  before_destroy :check_last_admin
  attr_accessor :validation_success

  enum authority: ["member", "admin"]
  validates :name, presence: true,
                   uniqueness: true,
                   length: {maximum: 32}
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  
  def check_password_save
    errors.add(:password, I18n.t("users.longer")) if password.present? && password.length < 4
    errors.add(:password, I18n.t("users.present")) if password.blank?
    errors.add(:password, I18n.t("users.confirmation")) if password != password_confirmation
    if errors.count == 0
      self.validation_success = true
      return save
    else
      self.validation_success = false
      return self
    end
  end

  private
  def check_last_admin 
    if User.admin.size == 1 && self.admin?
      errors.add(:base, I18n.t("users.last_admin"))
      throw :abort
    end
  end
end
