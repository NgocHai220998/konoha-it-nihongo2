class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  self.abstract_class = true
end
