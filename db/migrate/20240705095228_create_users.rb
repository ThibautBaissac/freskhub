class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uuid, null: false
      t.string :email, null: false
      t.string :firstname
      t.string :lastname
      t.text :description
      t.string :ui_language, null: false, default: "fr"
      t.datetime :last_login_at
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end

    add_index :users, :uuid, unique: true
    add_index :users, :email, unique: true
    add_index :users, :firstname
    add_index :users, :lastname
  end
end
