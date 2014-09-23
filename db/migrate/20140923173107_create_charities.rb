class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
    end

    create_table :donations do |t|
      t.integer :amount
      t.integer :charity_id
      t.integer :user_id
    end

    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :charity_id
      t.integer :duration_id
    end

    create_table :durations do |t|
      t.string :duration
    end
  end
end
