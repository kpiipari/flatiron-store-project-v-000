class UpdateCartsTable < ActiveRecord::Migration
  def change
    change_column_default(:carts, :status, 'not-submitted')
  end
end
