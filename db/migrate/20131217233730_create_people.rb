class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.text :first_name
      t.text :last_name
      t.text :permalink
      t.text :homepage_url
      t.text :birthplace
      t.text :twitter_username
      t.text :linkedin_url
      t.text :blog_url
      t.text :github_url
      t.text :angellist_url
      t.text :image
      t.text :tags
      t.text :investments
      t.text :relationships
      t.integer :born_day
      t.integer :born_month
      t.integer :born_year
    end
  end
end
