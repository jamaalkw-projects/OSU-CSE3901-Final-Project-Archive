class CorrectChoice < ApplicationRecord
  belongs_to :question
  validates :option, presence: true, length: {minimum: 1}, allow_blank: false
end
