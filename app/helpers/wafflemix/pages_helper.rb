module Wafflemix
  module PagesHelper

    def link_with_parents(page)
      if Page.ancestors_of(page).any?
        [Page.ancestors_of(page).map{|p| p.title.parameterize}, page.link_url].join('/').gsub(/\/\//, '/')
      else
        page.link_url
      end
    end

  end
end
