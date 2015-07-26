module CategoriesHelper
  def get_error_message(sym, resource)
    resource.errors[sym].first
  end

  def categories_array
    Category.all.map{ |a| a.name }
  end
end
