class Category < ActiveRecord::Base
  validates :name, :description,
            :presence => {:message => "Cannot be blank"}

  validates :name,
            :uniqueness => {:message => "Name must be unique"}
            
end
