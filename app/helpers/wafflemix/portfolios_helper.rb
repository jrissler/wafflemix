module Wafflemix
  module PortfoliosHelper
    def portfolio_tree_view(portfolios)
      portfolios.map do |portfolio|
        content_tag(:li, :id => dom_id(portfolio)) do
          render(:partial => 'wafflemix/admin/portfolios/portfolio', :object => portfolio)
        end
      end.join.html_safe
    end
  end
end
