class CreateBattleCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_characters do |t|
      t.integer :battle_id
      t.integer :character_id

      t.timestamps
    end
  end
end


