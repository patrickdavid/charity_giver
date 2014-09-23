class Cart < ActiveRecord::Base
  has_many :donations
  belongs_to :user
    self.value = 0

end
