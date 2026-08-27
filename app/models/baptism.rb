class Baptism < ApplicationRecord
  belongs_to :pastor

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :pastor_id, presence: true

  validates :status,
            presence: true,
            inclusion: {
              in: %w[agendado realizado cancelado]
            }
end
