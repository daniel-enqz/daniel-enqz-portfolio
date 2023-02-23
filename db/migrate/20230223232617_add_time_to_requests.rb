class AddTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    change_table :requests, bulk: true do |t|
      t.string :start_time
      t.string :end_time
    end
  end
end
