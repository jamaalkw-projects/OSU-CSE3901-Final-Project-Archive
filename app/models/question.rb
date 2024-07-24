class Question < ApplicationRecord
  belongs_to :quiz
  has_many :correct_choices, dependent: :destroy
  has_many :incorrect_choices, dependent: :destroy

  accepts_nested_attributes_for :correct_choices, allow_destroy: true
  accepts_nested_attributes_for :incorrect_choices, allow_destroy: true

  validates :content, length: {minimum: 1}, allow_blank: false
end
