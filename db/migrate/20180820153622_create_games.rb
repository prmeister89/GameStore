class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :original_release_date
      t.string :original_game_rating
      t.string :platforms
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end
