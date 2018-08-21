class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

<<<<<<< HEAD
=======
  validates :condition, presence: true
  validates :list_price, presence: true
>>>>>>> 79696ddb608f37e9b6243f8caa38550b8b81e5e8
end
