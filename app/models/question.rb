class Question < ApplicationRecord
  belongs_to :quiz
  has_many :correct_choices, dependent: :destroy

  accepts_nested_attributes_for :correct_choices, allow_destroy: true
end
