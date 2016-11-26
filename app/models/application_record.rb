# app/models/application_record.rb
# To abstract ActiveRecord in Website
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
