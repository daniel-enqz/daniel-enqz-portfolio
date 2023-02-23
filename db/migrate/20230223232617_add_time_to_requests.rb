class AddTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    change_table :requests, bulk: true do |t|
      t.time :start_time
      t.time :end_time
    end
  end
end
