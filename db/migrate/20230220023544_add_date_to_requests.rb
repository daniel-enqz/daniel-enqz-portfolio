class AddDateToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :date, :date
  end
end
