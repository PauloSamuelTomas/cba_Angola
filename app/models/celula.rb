class Celula < ApplicationRecord
  has_many :members
  has_many :workers

  belongs_to :responsavel,
             class_name: "Worker",
             optional: true

  validates :name, presence: true
  validates :description, presence: true

  validate :responsavel_deve_pertencer_a_celula

  private

  def responsavel_deve_pertencer_a_celula
    return if responsavel.nil?

    if responsavel.celula_id != id
      errors.add(
        :responsavel,
        "deve pertencer à mesma célula"
      )
    end
  end
end
