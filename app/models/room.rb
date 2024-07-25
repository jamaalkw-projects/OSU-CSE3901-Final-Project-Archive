class Room < ApplicationRecord
  belongs_to :quiz

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users

  validates_uniqueness_of :room_number
  validates :room_number, length: {minimum: 6, maximum: 20, message: 'must be at least 6 chars long.'}
  validates :room_number, numericality: {only_integer: true, message: 'can only contain numbers'}

  broadcasts_to -> (room) { "rooms" }
end