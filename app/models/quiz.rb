class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :incorrect_choices, dependent: :destroy
end
