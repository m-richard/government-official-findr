class AddSen2LinkToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :sen2_link, :string
  end
end
