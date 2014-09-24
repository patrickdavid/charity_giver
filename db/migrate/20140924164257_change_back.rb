class ChangeBack < ActiveRecord::Migration
  def change
    remove_column :donations, :amount
    add_column :donations, :amount, :decimal
  end
end
