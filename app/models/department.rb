class Department < ApplicationRecord
  has_many :members

  validates :name, presence: true
  validates :responsavel, presence: true
  validates :description, presence: true
end
