class AddTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :time, :string
  end
end
