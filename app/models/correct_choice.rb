=begin 
  correct_choice.rb - Project 6
  Created 07/24/24 by Nicholas Colacarro
=end
class CorrectChoice < ApplicationRecord
  belongs_to :question
  validates :option, presence: true, length: {minimum: 1}, allow_blank: false
end
