module ApplicationHelper
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "card border-danger") do
        concat(content_tag(:div, class: "card-header bg-danger text-white") do
          concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
        end)
        concat(content_tag(:ul, class: 'mb-0 list-group list-group-flush') do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg, class: 'list-group-item')
          end
        end)
      end
    end
  end
end
