class BaseSchema < Dry::Validation::Schema
  configure do
    config.messages_file = '/config/locales/validation_errors.yml'
    config.messages = :i18n
  end
end