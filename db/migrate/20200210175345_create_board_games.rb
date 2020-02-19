class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.integer :owner_id
      t.string :name
      t.integer :minimum_age
      t.string :difficulty
      t.text :description
      t.string :game_length
      t.string :number_of_player
      t.string :setup_time
      t.string :array_num_player
      # t.integer :is_saved
      # t.timestamps null: false
    end
  end
end

# :name, :number_of_player, :minimum_age, :difficulty, :description, :game_length, :setup_time, :array_num_player
