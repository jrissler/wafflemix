module Wafflemix
  module ApplicationHelper

    def top_nav
      output = ''
      output += content_tag(:div, :class => 'navbar navbar-fixed-top') do
        content_tag(:div, :class => 'navbar-inner') do
          content_tag(:div, :class => 'container') do
            container_content = ''
              container_content += content_tag(:div, :class => 'btn btn-navbar', :type => 'button', 'data-toggle' => 'collapse', 'data-target' => '.nav-collapse') do
                icon_bar = ''
                icon_bar += content_tag(:span, '', :class => 'icon-bar')
                icon_bar += content_tag(:span, '', :class => 'icon-bar')
                icon_bar += content_tag(:span, '', :class => 'icon-bar')
                icon_bar.html_safe
              end
              container_content += link_to('WaffleMix', '#', :class => 'brand')
              container_content += content_tag(:div, '', :class => 'nav-collapse collapse') do
                content_tag(:ul, :class => 'nav') do
                  top_nav_links.html_safe
                end
              end
            container_content.html_safe
          end
        end
      end
      output.html_safe
    end

    def main_subnav
      output = ''
      output += content_tag(:div, :class => 'subnav') do
        content_tag(:ul, :class => 'nav nav-pills') do
          sub_nav_links.html_safe
        end
      end
      output.html_safe
    end

    def top_nav_links
      t = content_tag(:li, link_to('Switch to Site', root_path, :class => 'brand brand_switch'))
      t += content_tag(:li, link_to('Dashboard', '#'), :class => 'active')
      t += content_tag(:li, link_to('Pages', admin_pages_path))
      t += content_tag(:li, link_to('Users', admin_users_path))
      t += content_tag(:li, link_to('Files and Images', admin_assets_path))
      t += content_tag(:li, link_to('Categories', admin_categories_path))
      t += content_tag(:li, '', :class => 'divider-vertical')
      t += content_tag(:li, link_to('Examples', '#'))
      t += content_tag(:li, link_to('Customize', '#'))
    end

    def sub_nav_links
      t = content_tag(:li, link_to('Global styles', '#'))
      t += content_tag(:li, link_to('Grid system', '#'))
      t += content_tag(:li, link_to('Fluid grid system', '#'))
      t += content_tag(:li, link_to('Customizing', '#'))
      t += content_tag(:li, link_to('Layouts', '#'))
      t += content_tag(:li, link_to('Responsive design', '#'))
    end

    def main_menu(pages)
      pages.map do |page, sub_pages|
        content_tag(:li, :id => page.title, :class => menu_level_class(page)) do
          link_to(page.title, link_with_parents(page)) + (content_tag(:ul, main_menu(sub_pages)) if sub_pages.any?)
        end
      end.join.html_safe
    end

    def menu_level_class(page)
      if page.is_root?
        'level1'
      elsif page.parent.is_root?
        'level2'      
      else
        'level3'
      end
    end

  end
end
