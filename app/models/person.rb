class Person < ActiveRecord::Base
  serialize :image
  serialize :tags
  serialize :investments
  serialize :relationships
  serialize :web_presences

  has_many :associations, dependent: :destroy
  has_many :associates, through: :associations

  has_many :inverse_associations,
           class_name: 'Association',
           foreign_key: :associate_id
  has_many :inverse_associates,
           through: :inverse_associations,
           dependent: :destroy,
           source: :person
  
  has_many :affiliations
  has_many :companies, through: :affiliations

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :last_name, scope: :first_name
end