class Company < ActiveRecord::Base
  def self.search(company)
    # binding.pry
    Crunchbase::Company.get(company)
  end
end