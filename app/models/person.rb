class Person < ActiveRecord::Base
  serialize :image
  serialize :tags
  serialize :investments
  serialize :relationships

  has_many :associations
  has_many :associates, through: :associations #, uniq: true

  has_many :inverse_associations,
           class_name: 'Association',
           foreign_key: :associate_id
  has_many :inverse_associates,
           through: :inverse_associations,
           # uniq: true,
           source: :person
  
  has_many :affiliations
  has_many :companies, through: :affiliations #, uniq: true

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :last_name, scope: :first_name
  validates_uniqueness_of :person_id, scope: :associate_id
  validates_uniqueness_of :company_id, scope: :person_id
end