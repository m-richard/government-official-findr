class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name, null: false
      t.string :representative, null: false

      t.timestamps
    end
  end
end
