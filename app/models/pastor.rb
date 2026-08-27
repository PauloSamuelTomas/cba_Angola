class Pastor < ApplicationRecord
validates :name, presence: true
validates :phone, presence: true
validates :email,
          format: { with: URI::MailTo::EMAIL_REGEXP },
          allow_blank: true

  has_many :baptisms
  has_many :weddings
  has_many :appointments
end
