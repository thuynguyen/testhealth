class CreateExamines < ActiveRecord::Migration
  def change
    create_table :examines do |t|
      t.integer :kind
      t.float :price
      t.references :patient

      t.timestamps
    end
  end
end
