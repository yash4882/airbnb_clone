class AddUserIdToProperties < ActiveRecord::Migration[7.2]
  def change
    add_reference :properties, :user, null: false, foreign_key: true
  end
end
