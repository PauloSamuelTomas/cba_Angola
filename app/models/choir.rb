class Choir < ApplicationRecord
  has_many :members


  validates :name, presence: true
  validates :description, presence: true
  validates :leader, presence: true
end
