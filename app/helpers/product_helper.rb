module ProductHelper
  def category
    Category.pluck :name, :id
  end

  def select_category
    Category.all.map { |category| [category.name, category.id]}
  end
end
