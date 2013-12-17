class Company < ActiveRecord::Base
  serialize :logo_url
  serialize :offices
  serialize :tags

  def self.search(company)
    # binding.pry
    Crunchbase::Company.get(company)
  end
end