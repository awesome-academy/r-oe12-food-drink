module SuggestsHelper
  def select_status
    Suggest.statuses.map{|key, value| [key,value]}
  end
end
