module PublicationHelper
  def first_letter(act_title)
    upper_title = act_title.capitalize
    (upper_title == act_title)
  end
end
