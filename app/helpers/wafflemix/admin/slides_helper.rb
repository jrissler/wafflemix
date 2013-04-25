module Wafflemix
  module Admin::SlidesHelper
    def slide_tree_view(slides)
      slides.map do |slide|
        content_tag(:li, :id => dom_id(slide)) do
          render(:partial => 'wafflemix/admin/slides/slide', :object => slide)
        end
      end.join.html_safe
    end
  end
end
