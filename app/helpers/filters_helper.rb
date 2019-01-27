module FiltersHelper
  def render_alphabet
    result = []
    ("A".."Z").each do |e|
      result << (link_to e, filter_params.merge(alpha: e), class: "btn")
    end
    safe_join result
  end

  def filter_params
    params.permit :alpha, :name, :category_id, :min_price, :max_price, :rate
  end
end
