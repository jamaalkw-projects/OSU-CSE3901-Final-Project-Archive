class Scoreboard < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  validates :user_id, presence: true
  validates :quiz_id, presence: true
end
