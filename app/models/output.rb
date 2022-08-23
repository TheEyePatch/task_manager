class Output < ApplicationRecord
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: %i[date] }
  has_one :overtime_work, class_name: 'Work::Overtime'
  has_one :regular_work, class_name: 'Work::Regular'
end
