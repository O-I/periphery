class MainController < ApplicationController
  def index
    # @companies = Company.all
    @company = Crunchbase::Company.get('Docurated')
  end

end
