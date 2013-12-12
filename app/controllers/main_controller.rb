class MainController < ApplicationController
  def index
    # @companies = Company.all
    @company = Crunchbase::Company.get('Apple')
  end

end
