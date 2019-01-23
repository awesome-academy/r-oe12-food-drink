module ProductHelper
  def category
    Category.pluck :name, :id
  end

end
