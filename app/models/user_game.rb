class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :condition, presence: true
  validates :list_price, presence: true
end
