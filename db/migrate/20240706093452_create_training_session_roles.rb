class CreateTrainingSessionRoles < ActiveRecord::Migration[7.1]
  def change
    create_table(:training_session_roles) do |t|
      t.string(:type, null: false)
      t.string(:status, null: false)
      t.integer(:anonymous_count, null: false, default: 0)
      t.references(:training_session, null: false, foreign_key: true)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end

    add_index(:training_session_roles, :type)
  end
end
