
class Wedding < ApplicationRecord
  belongs_to :pastor

  validates :groom, presence: true
  validates :bride, presence: true
  validates :date, presence: true
  validates :pastor_id, presence: true
end
