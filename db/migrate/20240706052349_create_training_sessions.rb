class CreateTrainingSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :training_sessions do |t|
      t.text :participants_info
      t.text :facilitators_info
      t.string :uuid, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :max_participants, null: false, default: 0
      t.string :connexion_url
      t.boolean :published
      t.references :language, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.references :training_session_category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :training_sessions, :uuid, unique: true
  end
end
