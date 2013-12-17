class Company < ActiveRecord::Base
  serialize :logo_url
  serialize :offices
  serialize :tags
  # serialize :relationships

  has_many :persons

  def self.search(company)
    # binding.pry
    Crunchbase::Company.get(company)
  end
end