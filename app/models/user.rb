class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :quizzes,   dependent: :destroy 
  has_many :scoreboards, dependent: :destroy
  validates :username, length: {minimum: 5}, allow_blank: false
end