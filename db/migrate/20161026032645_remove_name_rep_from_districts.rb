class RemoveNameRepFromDistricts < ActiveRecord::Migration[5.0]
  def change
    remove_column :districts, :name
  end
end
