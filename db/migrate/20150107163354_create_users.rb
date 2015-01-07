class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :device_token
    end

    add_index :users, :device_token, unique: true
  end
end
