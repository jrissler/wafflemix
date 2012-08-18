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
              container_content += link_to('WaffleMix', main_app.root_path, :class => 'brand')
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
      t = content_tag(:li, link_to('Overview', '#'), :class => 'active')
      t += content_tag(:li, link_to('Scaffolding', '#'))
      t += content_tag(:li, link_to('Base CSS', '#'))
      t += content_tag(:li, link_to('Components', '#'))
      t += content_tag(:li, link_to('Javascript', '#'))
      t += content_tag(:li, link_to('Using LESS', '#'))
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

  end
end
