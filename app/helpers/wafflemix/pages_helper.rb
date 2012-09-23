module Wafflemix
  module PagesHelper

    def link_with_parents(page)
      if Page.ancestors_of(page).any?
        [Page.ancestors_of(page).map{|p| p.title.parameterize}, page.link_url].join('/').gsub(/\/\//, '/')
      else
        page.link_url
      end
    end

    def tree_view(pages)
      pages.map do |page, sub_pages|
        content_tag(:li, :id => dom_id(page)) do
          render(:partial => 'wafflemix/Admin/pages/page', :object => page) + (content_tag(:ul, tree_view(sub_pages)) if sub_pages.any?)
        end
      end.join.html_safe
    end

  end
end
