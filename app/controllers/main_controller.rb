class MainController < ApplicationController

  def show
  end

  def search
    @company = Crunchbase::Company.find(params[:search])
    @founders = @company.relationships.map do |founder|
      Crunchbase::Person.get(founder.person_permalink)
    end
    binding.pry
    # @company = Company.search(params[:search]
  end

end
