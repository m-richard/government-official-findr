class AddRepnameToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :rep_name, :string
  end
end
