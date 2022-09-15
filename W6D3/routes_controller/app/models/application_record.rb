class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  config.action_controller.default_protect_from_forgery = false
end
