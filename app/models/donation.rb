class Donation < ActiveRecord::Base
  belongs_to :charity
  belongs_to :user
  validates :amount, presence: true

end
