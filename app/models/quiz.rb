class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  validates :quiz_name, presence: true, length: {minimum: 8, maximum: 50, message: 'must be at least 8 chars long.'}
end
