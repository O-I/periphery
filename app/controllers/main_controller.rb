class MainController < ApplicationController

  def show
  end

  def search
    unless params[:search].blank?
      begin
        search_term = params[:search].split.join('-').gsub('.', '-')
        @company = Crunchbase::Company.get(search_term)
        @people = @company.relationships.map do |person|
          Crunchbase::Person.get(person.person_permalink)
        end
      rescue
        redirect_to root_path, alert: "Sorry, we couldn't find anything on `#{params[:search]}`"
      end
      # @company = Company.search(params[:search])
      # search_term = params[:search].split.join('-').gsub('.', '-')
      # @company = Company.where(permalink: search_term)
      # Crunchbase::Company.get(search_term) if @company.empty?
      # @people = @company.relationships.map do |person|
      #   Crunchbase::Person.get(person.person_permalink)
      # end
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
