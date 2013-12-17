class Person < ActiveRecord::Base
  has_many :connections
  belongs_to :company
end