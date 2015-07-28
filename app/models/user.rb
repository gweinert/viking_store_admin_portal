class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  belongs_to :shipping_address, :class_name => "Address",
                                :foreign_key => "shipping_id"
  belongs_to :billing_address, :class_name => "Address",
                                :foreign_key => "billing_id"
  has_one :credit_card, :dependent :destroy

  def self.new_users(input_day)
    self.where("created_at > ?", input_day.days.ago).count
  end

end

