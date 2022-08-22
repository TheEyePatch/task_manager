class CreateOutputs < ActiveRecord::Migration[6.0]
  def change
    create_table :outputs do |t|
      t.bigint :employee_id
      t.text :remarks_one
      t.text :remars_two
      t.date :date
      t.timestamps
    end
  end
end
