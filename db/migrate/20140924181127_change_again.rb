class ChangeAgain < ActiveRecord::Migration
  def change
    remove_column :donations, :amount
    add_column :donations, :amount, :string
  end
end
