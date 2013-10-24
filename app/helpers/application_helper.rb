module ApplicationHelper
  def title_or_default(title)
    return title unless title.blank?
    "<em>Untitled</em>"
  end

  def active_on(title)
    "active" if content_for(:page_title) == title
  end
end
