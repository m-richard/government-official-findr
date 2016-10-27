class RemoveRepFromDistricts < ActiveRecord::Migration[5.0]
  def change
    remove_column :districts, :representative
  end
end
