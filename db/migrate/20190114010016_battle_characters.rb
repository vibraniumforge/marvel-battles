class BattleCharacters < ActiveRecord::Migration[5.2]
 
  def change
    create_table :battlecharacters do |t|
      t.integer :battle_id
      t.integer :character_id

      t.timestamps
    end
  end

end
