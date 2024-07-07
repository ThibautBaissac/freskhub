class CreateUserRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_roles do |t|
      t.string :name, null: false, index: true
      t.references :user_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
