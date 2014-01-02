class MainController < ApplicationController

  # TODO; Separate out non-controllery statements into the model
  # TODO; Needs major DRYing up and separation of concerns
  # TODO; Consider using Redis caching instead of a database
  # TODO; Figure out how to pull down photos from other sources
  # TODO; Clean up the database; view logic is getting out of hand
  # TODO; Networks to investigate next: Angellist, LinkedIn, Venture Beats Profiles
  def index
  end

  def search
    unless params[:search].blank?
      begin
        search_term = params[:search].split.join('-').gsub('.', '-')
        if Company.where(permalink: search_term).first
          @company = Company.where(permalink: search_term).first
        else
          @company = Crunchbase::Company.get(search_term)
          Company.create(name: @company.name, 
                         permalink: @company.permalink,
                         description: @company.description,
                         overview: @company.overview,
                         category: @company.category_code,
                         logo_url: @company.image,
                         homepage_url: @company.homepage_url,
                         blog_url: @company.blog_url,
                         email_address: @company.email_address,
                         phone_number: @company.phone_number,
                         offices: @company.offices,
                         tags: @company.tags,
                         twitter_username: @company.twitter_username,
                         total_money_raised: @company.total_money_raised,
                         relationships: @company.relationships,
                         acquired?: @company.acquisition,
                         died?: @company.deadpooled?,
                         number_of_employees: @company.number_of_employees,
                         founded_year: @company.founded_year,
                         death_year: @company.deadpooled_year) unless @company.overview.blank? || @company.relationships.blank?
        end
        @people = @company.relationships.map do |person|
          unless Person.where(permalink: person.person_permalink).compact.blank?
            Person.where(permalink: person.person_permalink).first
          else 
            peep = Crunchbase::Person.get(person.person_permalink)
            Person.create(first_name: peep.first_name,
                      last_name: peep.last_name,
                      permalink: peep.permalink,
                      overview: peep.overview,
                      homepage_url: peep. homepage_url,
                      birthplace: peep.birthplace,
                      twitter_username: peep.twitter_username,
                      blog_url: peep.blog_url,
                      web_presences: peep.web_presences,
                      image: peep.image,
                      tags: peep.tags,
                      investments: peep.investments,
                      relationships: peep.relationships,
                      born_day: peep.born_day,
                      born_month: peep.born_month,
                      born_year: peep.born_year)
          end
        end
        @people.compact!
      rescue Exception => e
        redirect_to root_path, alert: "Sorry, we couldn't find anything on `#{params[:search]}`"
        puts e
      end
    else
      redirect_to root_path
    end
  end

end
