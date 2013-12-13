class MainController < ApplicationController

  def show
    # @companies = Company.all
    # @company = Crunchbase::Company.get('pixtr')
    # respond_with Crunchbase::Company.get(params[:id])
    # @company = Crunchbase::Company.get(params[:id])
  end

  def search
    @company = Crunchbase::Company.find(params[:search])
    binding.pry
      # @company = Company.search(params[:search]
  end

end
