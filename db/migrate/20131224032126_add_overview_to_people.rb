class AddOverviewToPeople < ActiveRecord::Migration
  def change
    add_column :people, :overview, :text
  end
end
