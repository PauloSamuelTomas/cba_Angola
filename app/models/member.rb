class Member < ApplicationRecord
  # validacaão
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :birth_date, presence: true
  validates :phone, presence: true
  validates :address, presence: true

  validates :email,
          format: { with: URI::MailTo::EMAIL_REGEXP },
          allow_blank: true

  # Um membro pertence um deparatmento, celula ou coro
  #
  belongs_to :department, optional: true
  belongs_to :celula, optional: true
  belongs_to :choir, optional: true

  has_many :baptisms
  has_many :appointments
end
