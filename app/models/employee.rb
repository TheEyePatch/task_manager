class Employee < User
  has_many :outputs
  has_many :regular_works, through: :outputs, class_name: 'Work::Regular'
  has_many :overtime_works, through: :outputs, class_name: 'Work::Overtime'
end