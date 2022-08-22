class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.belongs_to :output
      t.integer :work_hrs
      t.integer :work_num
      t.string :type
      t.timestamps
    end
  end
end
