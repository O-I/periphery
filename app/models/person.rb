class Person < ActiveRecord::Base
  has_many :connections
  has_many :associates, through: :connections

  has_many :inverse_connections,
           class_name: 'Connection',
           foreign_key: :associate_id
  has_many :inverse_associates,
           through: :inverse_connections,
           source: :person
  
  has_many :affiliations
  has_many :companies, through: :affiliations
end