class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games
  has_many :reviews
  has_many :games, through: :reviews

  validates :username, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
end
