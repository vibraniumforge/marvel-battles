class CreateFbUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :fb_users do |t|
      t.string :name
      t.string :email
      t.string :uid
      t.string :image

      t.timestamps
    end
  end
end
