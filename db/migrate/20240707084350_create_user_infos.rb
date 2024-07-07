class CreateUserInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :user_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fresk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
