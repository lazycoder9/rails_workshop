class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options = nil)
    collection = @builder.object.state_events
    @builder.select attribute_name, collection, input_options
  end
end
