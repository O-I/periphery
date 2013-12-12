class MainController < ApplicationController
  def show
    # @companies = Company.all
    @company = Crunchbase::Company.get('Docurated')
  end

end
