module Wafflemix
  module Admin::PagesHelper

    def tree_view(pages)
      pages.map do |page, sub_pages|
        content_tag(:li, :id => dom_id(page)) do
          render(:partial => 'wafflemix/Admin/pages/page', :object => page) + (content_tag(:ul, tree_view(sub_pages)) if sub_pages.any?)
        end
      end.join.html_safe
    end

  end
end
