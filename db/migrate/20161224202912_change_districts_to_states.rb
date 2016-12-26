class ChangeDistrictsToStates < ActiveRecord::Migration[5.0]
  def change
    rename_table :districts, :states
  end
end
