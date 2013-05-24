module ApplicationHelper

  def nav_item(name, url_options, html_options = {})
    content_tag :li, :class => current_page?(url_options) ? 'active' : nil do
      link_to name, url_options, html_options
    end
  end

end
