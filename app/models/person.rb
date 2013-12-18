class Person < ActiveRecord::Base
  serialize :image
  serialize :tags
  serialize :investments
  serialize :relationships

  has_many :associations
  has_many :associates, through: :associations

  has_many :inverse_associations,
           class_name: 'Association',
           foreign_key: :associate_id
  has_many :inverse_associates,
           through: :inverse_associations,
           source: :person
  
  has_many :affiliations
  has_many :companies, through: :affiliations
end