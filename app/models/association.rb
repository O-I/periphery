class Association < ActiveRecord::Base
  belongs_to :person
  belongs_to :associate, class_name: 'Person'
end