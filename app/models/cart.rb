class Cart < ActiveRecord::Base
  has_many :donations
  belongs_to :user
  has_many :charges
    self.value = 0

end
