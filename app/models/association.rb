class Association < ActiveRecord::Base
  belongs_to :person
  belongs_to :associate, class_name: 'Person'
  validates_uniqueness_of :person_id, scope: :associate_id
end