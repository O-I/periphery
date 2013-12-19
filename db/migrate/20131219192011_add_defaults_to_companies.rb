class AddDefaultsToCompanies < ActiveRecord::Migration
  def change
    change_column_default :companies, :description, ''
    change_column_default :companies, :overview, ''
    change_column_default :companies, :one_line_pitch, ''
    change_column_default :companies, :category, ''
    change_column_default :companies, :logo_url, []
    change_column_default :companies, :homepage_url, ''
    change_column_default :companies, :blog_url, ''
    change_column_default :companies, :email_address, ''
    change_column_default :companies, :phone_number, ''
    change_column_default :companies, :offices, []
    change_column_default :companies, :twitter_username, ''
    change_column_default :companies, :relationships, []
  end
end
