class Output < ApplicationRecord
  belongs_to :employee
  validates :employee_id, uniqueness: { scope: %i[date] }
  has_one :overtime_work, class_name: 'Work::Overtime'
  has_one :regular_work, class_name: 'Work::Regular'

  has_rich_text :remarks_one
  has_rich_text :remarks_two

  scope :with_date, ->(start_date, end_date) {
    where(date: start_date..end_date) if start_date.present? && end_date.present?
  }
end
