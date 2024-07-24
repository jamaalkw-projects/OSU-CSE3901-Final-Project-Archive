class IncorrectChoice < ApplicationRecord
  belongs_to :question
  validates :option, length: {minimum: 1}, allow_blank: false
end
