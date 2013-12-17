class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :name
      t.text :permalink
      t.text :description
      t.text :overview
      t.text :one_line_pitch
      t.text :category
      t.text :logo_url
      t.text :homepage_url
      t.text :blog_url
      t.text :email_address
      t.text :phone_number
      t.text :offices
      t.text :tags, default: []
      t.text :twitter_username
      t.text :total_money_raised
      t.text :acquired_price
      t.text :acquirer
      t.text :relationships
      t.boolean :acquired?, default: false
      t.boolean :died?, default: false
      t.integer :number_of_employees
      t.integer :founded_year
      t.integer :acquired_year
      t.integer :death_year
    end
  end
end
