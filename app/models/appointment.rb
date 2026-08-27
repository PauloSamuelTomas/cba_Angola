class Appointment < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :pastor, optional: true

  validates :date, presence: true
  validates :time, presence: true
  validates :subject, presence: true
  validates :status, presence: true

  validate :member_or_visitor

  private

  def member_or_visitor
    if member_id.blank?
      if name.blank?
        errors.add(:name, "é obrigatório para visitantes")
      end

      if email.blank?
        errors.add(:email, "é obrigatório para visitantes")
      end

      if phone.blank?
        errors.add(:phone, "é obrigatório para visitantes")
      end
    end
  end
end
