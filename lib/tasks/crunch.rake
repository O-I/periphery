require 'crunchbase'

namespace :crunch do
  desc "Get all data for 50 randomly selected companies listed by Crunchbase"
  task all_cos: :environment do
    all_companies_list = Crunchbase::Company.all.sample(50)
    all_companies_list.each do |company|
      begin
        puts company.name
        co = Crunchbase::Company.get(company.permalink)
        unless Company.where(permalink: company.permalink).exists?
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
                         acquired?: co.acquisition,
                         died?: co.deadpooled?,
                         number_of_employees: co.number_of_employees,
                         founded_year: co.founded_year,
                         # acquired_year: co.acquisition['acquired_year'],
                         death_year: co.deadpooled_year)
        end
      rescue Exception => e
        puts "Something went amiss"
        puts "The exception is #{e}"
        next
      end
    end
  end
end