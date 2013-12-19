class Company < ActiveRecord::Base
  serialize :logo_url
  serialize :offices
  serialize :tags
  serialize :relationships

  has_many :affiliations, dependent: :destroy
  has_many :people, through: :affiliations

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :permalink
  validates_uniqueness_of :permalink

  def self.search(company)
    # binding.pry
    Crunchbase::Company.get(company)
  end
end