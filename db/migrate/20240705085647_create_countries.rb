class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table(:countries) do |t|
      t.string(:name)
      t.string(:alpha2_code)
      t.string(:alpha3_code)

      t.timestamps
    end

    add_index(:countries, :name, unique: true)
    add_index(:countries, :alpha2_code, unique: true)
    add_index(:countries, :alpha3_code, unique: true)
  end
end
