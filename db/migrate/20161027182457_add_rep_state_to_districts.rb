class AddRepStateToDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :districts, :rep_state, :string
  end
end
