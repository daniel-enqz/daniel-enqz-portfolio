class AddTimezoneToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :timezone, :string, default: Rails.application.config.time_zone
  end
end
