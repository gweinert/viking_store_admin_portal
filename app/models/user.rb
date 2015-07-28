class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  belongs_to :shipping_address, :class_name => "Address",
                                :foreign_key => "shipping_id"
  belongs_to :billing_address, :class_name => "Address",
                                :foreign_key => "billing_id"
  has_one :credit_card, dependent: :destroy
  has_many :orders

  # scope :completed_orders, -> { where("checkout_date IS NOT NULL") }

  def self.new_users(input_day)
    self.where("created_at > ?", input_day.days.ago).count
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def completed_orders
    self.orders.where("checkout_date IS NOT NULL").count
  end

  def get_address(type = :shipping_address)
    address=self.send(type)
    "#{address.street_address} #{address.city.name}, #{address.state.name} #{address.zip_code}"
  end

end

