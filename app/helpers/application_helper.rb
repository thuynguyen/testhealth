module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
  
  class MenuTabBuilder < TabsOnRails::Tabs::Builder
    def open_tabs(options = {})
      @context.tag("ul", options, open = true)
    end

    def close_tabs(options = {})
      "</ul>".html_safe
    end

    def tab_for(tab, name, options, item_options = {})
      cl = (current_tab?(tab.to_s.split("_").first.to_sym) ? 'active temp' : item_options[:class])
      item_options[:class] = (current_tab?(tab) ? 'active text-menu' : cl)
      if name.blank?
        @context.link_to(options) do 
          @context.content_tag(:li, item_options) do
          end
        end
      else
        @context.content_tag(:li, item_options) do
          @context.link_to(name, options)
        end
      end
    end
  end
  
end
