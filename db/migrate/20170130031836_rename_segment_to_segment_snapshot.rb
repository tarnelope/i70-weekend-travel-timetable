class RenameSegmentToSegmentSnapshot < ActiveRecord::Migration[5.0]
  def change
    rename_table :segments, :segment_snapshots
  end
end
