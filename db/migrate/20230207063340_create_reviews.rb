class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :message
      t.integer :rating
      t.text :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
