require 'roo'
class Patient < ActiveRecord::Base
  attr_accessible :age, :date_of_birth, :examines_attributes, :name, :total, :examined_date

  has_many :examines
  accepts_nested_attributes_for :examines, :allow_destroy => true

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      exams = {}
      exams[:kind] = row["kind"]
      exams = exams.merge({:price => row["price"]})
      row.delete "kind"
      row.delete "price"
      row["date_of_birth"] = DateTime.new(row["date_of_birth"].to_i)
      patient = find_by_id(row["id"]) || new 
      patient.attributes = row.to_hash.slice(*accessible_attributes)
      patient.examines.build exams
      patient.save!
    end
  end 
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename) 
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end 
end
