class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.string :name
      t.string :location
      t.integer :participants
      t.integer :movie

      t.timestamps
    end
  end
end
