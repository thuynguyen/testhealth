class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.datetime :date_of_birth
      t.datetime :examined_date
      t.float :total
      t.string :address

      t.timestamps
    end
  end
end
