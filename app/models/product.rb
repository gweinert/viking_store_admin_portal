class Product < ActiveRecord::Base
  belongs_to :category
  has_many :orders, :class_name => "OrderContent"

  validates :sku,
              :uniqueness => {:message => "Needs to be unique"}

  validates :name, :description, :price, :presence => { :message => "Can not be blank" }


	def self.new_products(input_day)
		self.where("created_at > ?", input_day.days.ago).count
	end
end
