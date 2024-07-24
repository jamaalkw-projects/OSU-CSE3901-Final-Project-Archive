class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :quiz_name, presence: true, length: {minimum: 8, message: 'must be at least 8 chars long.'}
end
