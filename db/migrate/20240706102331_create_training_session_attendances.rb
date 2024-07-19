class CreateTrainingSessionAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table(:training_session_attendances) do |t|
      t.references(:facilitator, null: false, foreign_key: {to_table: :training_session_roles})
      t.references(:participant, null: false, foreign_key: {to_table: :training_session_roles})
      t.timestamps
    end
  end
end
