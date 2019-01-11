class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.string :name
      t.string :location
      t.integer :character_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
