class AddPlan < ActiveRecord::Migration
  def change
    add_column :donations, :plan, :string
  end
end
