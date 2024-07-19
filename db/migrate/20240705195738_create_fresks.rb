class CreateFresks < ActiveRecord::Migration[7.1]
  def change
    create_table(:fresks) do |t|
      t.string(:name, null: false)
      t.string(:identifier, null: false)
      t.string(:url)

      t.timestamps
    end
  end
end
