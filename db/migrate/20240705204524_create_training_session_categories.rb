class CreateTrainingSessionCategories < ActiveRecord::Migration[7.1]
  def change
    create_table(:training_session_categories) do |t|
      t.references(:fresk, null: false, foreign_key: true)
      t.string(:identifier, null: false)
      t.string(:format, null: false)

      t.timestamps
    end

    add_index(:training_session_categories, %i[fresk_id identifier], unique: true)
  end
end
