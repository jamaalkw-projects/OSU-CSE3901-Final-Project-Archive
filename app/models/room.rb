class Room < ApplicationRecord
  belongs_to :quiz

  validates_uniqueness_of :name
  validates :name, presence: true, length: { minimum: 6, maximum: 10 }, numericality: { only_integer: true }
  scope :public_rooms, -> { where(is_private: false) }
end
