class Patient < ActiveRecord::Base
  attr_accessible :age, :date_of_birth, :examines_attributes, :exam_type, :name, :price, :total, :examined_date

  has_many :examines
  accepts_nested_attributes_for :examines, :allow_destroy => true
  
end
