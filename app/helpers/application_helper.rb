module ApplicationHelper
  def page_title
    title = "Ebbinghaus"
    title = @page_title + " - " + title if @page_title
    title
  end
end
