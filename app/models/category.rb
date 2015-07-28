class Category < ActiveRecord::Base
  has_many :products, :class_name => :Product
  #has_many :orders, to be done

  validates :name, :description,
            :presence => {:message => "Cannot be blank"}

  validates :name,
            :uniqueness => {:message => "Name must be unique"}
            
end
