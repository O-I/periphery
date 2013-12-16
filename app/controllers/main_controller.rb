class MainController < ApplicationController

  def show
  end

  def search
    unless params[:search].blank?
      # @company = Company.search(params[:search])
      @company = Crunchbase::Company.get(params[:search].split.join('-'))
      # @peeps = @company.relationships.map do |peep|
        # Crunchbase::Person.get(peep.person_permalink)
      # end
      respond_to do |format|
        # format.html { redirect_to root_path }
        format.js
      end
      # binding.pry
    else
      redirect_to root_path
    end
  end

end
