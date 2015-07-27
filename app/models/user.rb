class User < ActiveRecord::Base

  has_many :addresses
  has_many :orders
  #has_many :products bonues come back to it
  

  def self.new_users(input_day)
    self.where("created_at > ?", input_day.days.ago).count
  end

end

