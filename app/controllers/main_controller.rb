class MainController < ApplicationController

  def show
  end

  def search
    @company = Crunchbase::Company.find(params[:search])
    @peeps = @company.relationships.map do |peep|
      Crunchbase::Person.get(peep.person_permalink)
    end
    binding.pry
    # @company = Company.search(params[:search])
  end

end
