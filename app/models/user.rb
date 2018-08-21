class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games

  validates :username, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
end
