class ChangeGaolsToGoals < ActiveRecord::Migration[7.0]
  def change
    rename_table :gaols, :goals
  end
end
