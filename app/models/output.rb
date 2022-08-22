class Output < ApplicationRecord
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: %i[date] }
  has_many :overtime_works, class_name: 'Work::Overtime'
  has_many :regular_works, class_name: 'Work::Regular'
end
