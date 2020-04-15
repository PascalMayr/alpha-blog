module ApplicationHelper
  def gravatar_for(user, options = { size: 80, class: "img-circle" })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    _class = options[:class]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: _class)
  end
end

module ApplicationHelper
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapRenderer
    end
    super *[collection_or_options, options].compact
  end

  class BootstrapRenderer < WillPaginate::ActionView::LinkRenderer
    protected
    def html_container(html)
      tag :nav, tag(:ul, html, class: "pagination pagination-sm"), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, rel: rel_value(page), class: 'page-link'),
        class: (page == current_page ? 'page-item active': 'page-item')
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#', class: 'page-link'),
        class: ['page-item', classname, ('disabled' unless page)].join(' ')
    end
  end
end