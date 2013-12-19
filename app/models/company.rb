class Company < ActiveRecord::Base
  serialize :logo_url
  serialize :offices
  serialize :tags
  serialize :relationships

  has_many :affiliations
  has_many :people, through: :affiliations #, uniq: true

  validates_presence_of :name
  validates_uniqueness_of :name
  # validates_uniqueness_of :company_id, scope: :person_id

  def self.search(company)
    # binding.pry
    Crunchbase::Company.get(company)
  end
end