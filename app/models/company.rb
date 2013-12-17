class Company < ActiveRecord::Base
  serialize :logo_url
  serialize :offices
  serialize :tags
  serialize :relationships

  has_many :affiliations
  has_many :people, through: :affiliations

  def self.search(company)
    # binding.pry
    Crunchbase::Company.get(company)
  end
end