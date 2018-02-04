class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    transitions = "#{clean_attribute_name}_transitions"
    object.send(transitions)
  end

  def input(wrapper_options)
    label_method = :human_event
    value_method = :event

    current_state_name = object.send("human_#{clean_attribute_name}_name")
    current_state = template.content_tag(:span, template.content_tag(:span, "#{I18n.t('.inputs.current_state')} #{current_state_name}", class: 'tag tag-info mx-1'))

    merged_html_options = merge_wrapper_options(input_html_options, wrapper_options)
    merged_input_options = input_options.merge(include_blank: 'select action')

    out = @builder.collection_select(
      attribute_name, collection, value_method, label_method,
      merged_input_options, merged_html_options
    )
    (out << current_state).html_safe
  end

  def human_state_name
    template.content_tag(:span, object.human_state_name, class: 'tag tag-info pull-right')
  end

  def clean_attribute_name
    attribute_name.to_s.gsub '_event', ''
  end
end
