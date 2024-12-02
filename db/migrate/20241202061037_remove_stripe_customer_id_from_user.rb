class RemoveStripeCustomerIdFromUser < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :stripe_customer_id
  end
end
