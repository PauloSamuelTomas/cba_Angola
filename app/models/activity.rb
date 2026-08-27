class Activity < ApplicationRecord
  has_many :schedules

  belongs_to :department, optional: true
  belongs_to :choir, optional: true

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :objective, presence: true

  # ==========================================
  # ORGANIZADOR
  # ==========================================

  def organizer
    if department.present?
      department.name
    elsif choir.present?
      choir.name
    else
      "Direção Paroquial"
    end
  end

  # ==========================================
  # APENAS UM ORGANIZADOR
  # ==========================================

  validate :apenas_um

  private

  def apenas_um
    if department_id.present? && choir_id.present?
      errors.add(
        :base,
        "A Actividade não pode pertencer a um departamento e um coro ao mesmo tempo"
      )
    end
  end
end
