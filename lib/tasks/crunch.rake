require 'crunchbase'

namespace :crunch do
  desc "Get all data for 10000 randomly selected companies listed on Crunchbase"
  task all_cos: :environment do
    all_companies_list = Crunchbase::Company.all.sample(10000)
    all_companies_list.each do |company|
      begin
        puts company.name
        unless Company.where(permalink: company.permalink).exists?
          co = Crunchbase::Company.get(company.permalink)
          Company.create(name: co.name, 
                         permalink: company.permalink,
                         description: co.description,
                         overview: co.overview,
                         # one_line_pitch: [(co.overview || '').match(/<p>(.*?\.)\W/)].flatten[-1],
                         category: co.category_code,
                         logo_url: co.image,
                         homepage_url: co.homepage_url,
                         blog_url: co.blog_url,
                         email_address: co.email_address,
                         phone_number: co.phone_number,
                         offices: co.offices,
                         tags: co.tags,
                         twitter_username: co.twitter_username,
                         total_money_raised: co.total_money_raised,
                         # acquired_price: co.acquisition['price_amount'],
                         # acquirer: co.acquisition['acquiring_company']['name'],
                         relationships: co.relationships,
                         acquired?: co.acquisition,
                         died?: co.deadpooled?,
                         number_of_employees: co.number_of_employees,
                         founded_year: co.founded_year,
                         # acquired_year: co.acquisition['acquired_year'],
                         death_year: co.deadpooled_year) unless co.overview.blank? || co.relationships.blank?
        end
      rescue Exception => e
        puts "Something went amiss"
        puts "The exception is #{e}"
        next
      end
    end
  end

  desc "Get people for companies in database if needed"
  task co_peeps: :environment do
    Company.all.flat_map(&:relationships).each do |person|
      begin
        puts person.person_permalink
        unless Person.where(permalink: person.person_permalink).exists?
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
      rescue Exception => e
        puts "Something went amiss"
        puts "The exception is #{e}"
        next
      end
    end
  end

  desc "Add overview and web presences if needed"
  task peep_extras: :environment do
    Company.all.flat_map(&:relationships).each do |person|
      begin
        puts person.person_permalink
        peep = Crunchbase::Person.get(p.permalink)
        person.update(overview: peep.overview, 
                      web_presences: peep.web_presences)
      rescue Exception => e
        puts "Something went amiss"
        puts "The exception is #{e}"
        next
      end
    end
  end
end