class CreateTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :translations do |t|
      t.references :translatable, polymorphic: true, null: false
      t.string :language, null: false
      t.string :content, null: false
      t.string :field, null: false

      t.timestamps
    end
  end
end
