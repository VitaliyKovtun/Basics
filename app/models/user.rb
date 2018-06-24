class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  PASSWORD_FORMAT = /\A
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
  /x

  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile

  validates :email, presence: true,
                    format: { with: EMAIL_FORMAT },
                    uniqueness: true
  validates :password, format: { with: PASSWORD_FORMAT },
                       length: { in: 8..40 },
                       confirmation: true
  validates :encrypted_password, presence: true
end
