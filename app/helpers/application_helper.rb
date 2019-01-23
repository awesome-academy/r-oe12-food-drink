module ApplicationHelper
  def full_title page_title = ""
    page_title.empty? ? t(".base_title") : page_title + " | " + t(".base_title")
  end

  def create_index params_page, index, per_page
    params_page = 1 if params_page.nil?
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end
end
