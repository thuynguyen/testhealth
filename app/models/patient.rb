class Patient < ActiveRecord::Base
  attr_accessible :age, :bod, :exam_type, :name, :price, :total

  has_many :examines
end
