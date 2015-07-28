module CategoriesHelper
  

  def categories_array
    Category.all.map{ |a| a.name }
  end
end
