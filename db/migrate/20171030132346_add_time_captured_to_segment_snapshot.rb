class AddTimeCapturedToSegmentSnapshot < ActiveRecord::Migration[5.1]
  def change
    add_column :segment_snapshots, :time_captured, :string
    add_column :segment_snapshots, :date_captured, :date
  end
end
