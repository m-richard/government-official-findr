class AddSen1LinkToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen1_link, :string
  end
end
