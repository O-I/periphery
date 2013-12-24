class AddWebPresencesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :web_presences, :text
  end
end
