class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :employeeID, :null => false, :default => ''
      t.integer :buildingID, :null => false, :default => ''
      t.integer :batteryID
      t.integer :columnID
      t.integer :elevatorID
      t.datetime :start_interv, :null => false, :default => ''
      t.datetime :stop_interv
      t.string :result, :null => false, :default => ''
      t.string :reports
      t.string :status, :null => false, :default => ''

      t.timestamps
    end
  end
end
