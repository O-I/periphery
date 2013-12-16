class MainController < ApplicationController

  def show
  end

  def search
    unless params[:search].blank?
      # @company = Company.search(params[:search])
      @company = Crunchbase::Company.get(params[:search].split.join('-'))
      @peeps = @company.relationships.map do |peep|
        Crunchbase::Person.get(peep.person_permalink)
      end
      # @pois = @peeps.map do |peep|
      #   poi_name = peep.person_permalink.sub('-', ' ')
      #   poi_id = AngellistApi.search(name).first.id
      #   AngellistApi.get_user(poi_id)
      # end
      # respond_to do |format|
      #   format.html { redirect_to root_path }
      #   format.js
      #   format.json { render @company }
      # end
      # binding.pry
    else
      redirect_to root_path
    end
  end

end
