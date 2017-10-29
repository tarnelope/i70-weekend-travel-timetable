class CreateTrafficSnapshots < ActiveRecord::Migration[5.0]
  def change
    create_table :traffic_snapshots do |t|

      t.timestamps
    end
  end
end
