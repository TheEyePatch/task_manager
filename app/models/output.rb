class Output < ApplicationRecord
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: %i[date] }
end
