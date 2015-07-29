class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_contents
  has_many :orders , :through => :order_contents
  validates  :name, :sku, {:uniqueness => true , :presence => true}
  validates  :description,  :presence => true


	def self.new_products(input_day)
		self.where("created_at > ?", input_day.days.ago).count
	end
end
