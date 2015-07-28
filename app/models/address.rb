class Address < ActiveRecord::Base
    belongs_to :user
    has_one :billing_user, :foreign_key => :billing_id, :class_name => "User", :dependent => :destroy
    has_one :shipping_user, :foreign_key => :shipping_id, :class_name => "User", :dependent => :destroy
    belongs_to :city
    belongs_to :state
end
