module ApplicationHelper

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-dismissable alert-info"
      when 'success' then "alert alert-dismissable alert-success"
      when 'error', 'alert' then "alert alert-dismissable alert-danger"
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
