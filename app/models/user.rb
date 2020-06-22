class User < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true,
                   length: {maximum: 32}
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: I18n.t('validation.user.email_format')}
  validates :password, presence: true,
                       confirmation: true, length: { minimum: 4 }
end
