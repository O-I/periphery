class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.belongs_to :person, index: true
      t.belongs_to :associate, index: true
    end
  end
end
