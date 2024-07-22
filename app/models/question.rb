class Question < ApplicationRecord
  belongs_to :quiz
  has_many :incorrect_choices, dependent: :destroy
end
