class CreateDailyTravelInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_travel_infos do |t|
      t.date :date
      t.text :weather
      t.text :special_events

      t.timestamps
    end
  end
end
