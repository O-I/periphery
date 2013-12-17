class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.belongs_to :person, index: true
      t.belongs_to :company, index: true
    end
  end
end
