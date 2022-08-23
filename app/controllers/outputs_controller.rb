class OutputsController < ApplicationController
  before_action :fetch_outputs, only: %i[index]

  def index; end

  def edit; end

  protected

  def fetch_outputs
    @outputs =
    if employee_signed_in?
      current_employee.outputs.includes(:regular_work, :overtime_work, :employee)
    elsif reviewer_signed_in?
      Output.includes(:regular_work, :overtime_work, :employee)
    end
  end
end
