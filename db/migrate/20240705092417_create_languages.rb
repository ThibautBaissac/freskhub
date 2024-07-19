class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table(:languages) do |t|
      t.string(:name)
      t.string(:set1_code)
      t.string(:set2_code)

      t.timestamps
    end

    add_index(:languages, :name, unique: true)
    add_index(:languages, :set1_code, unique: true)
    add_index(:languages, :set2_code, unique: true)
  end
end
