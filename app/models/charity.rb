class Charity < ActiveRecord::Base
  validates :name, presence: true
  has_many :donations



  def self.count_cart(user)
    sum = 0
    unless user == nil
    @cart = Donation.where(:user_id => user.id)
    @cart.each do |donation|
      sum += donation.amount.to_i
    end
  end
    @amount = sum * 100
    "$" + sum.to_s
  end

  def self.count_cart_int(user)
    sum = 0
    @cart = Donation.where(:user_id => user.id)
    @cart.each do |donation|
      sum += donation.amount.to_i
    end
    @amount = sum * 100
  end



end
