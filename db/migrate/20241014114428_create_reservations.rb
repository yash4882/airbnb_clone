class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.date :checkin_date
      t.date :checkout_date

      t.timestamps
    end
    add_index :reservations, [:user_id, :property_id, :checkin_date, :checkout_date], unique: true
  end
end
