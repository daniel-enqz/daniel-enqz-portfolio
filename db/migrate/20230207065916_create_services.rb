class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_services do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
