class Address < ActiveRecord::Base
  belongs_to :user
  has_one :billing_user,  :foreign_key => 'billing_id',
                          :class_name => "User"
  has_one :shipping_user, :foreign_key => 'shipping_id',
                          :class_name => "User"
  belongs_to :city
  belongs_to :state
  has_many :orders       

  def order_count
    Order.where("shipping_id = ? OR billing_id = ?", id, id).count
  end

end
