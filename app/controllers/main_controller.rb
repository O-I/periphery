class MainController < ApplicationController
  respond_to :json

  def show
    # @companies = Company.all
    # @company = Crunchbase::Company.get('pixtr')
    # respond_with Crunchbase::Company.get(params[:id])
    # @company = Crunchbase::Company.get(params[:id])
  end

  def search
    # puts params[:search]
    # @company = Crunchbase::Company.get()
    # @company = Company.search(params[:search])
  end

end
