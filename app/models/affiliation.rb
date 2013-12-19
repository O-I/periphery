class Affiliation < ActiveRecord::Base
  belongs_to :person
  belongs_to :company
  validates_uniqueness_of :company_id, scope: :person_id
end