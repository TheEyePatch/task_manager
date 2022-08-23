class OvertimesController < ApplicationController
  before_action :authenticate_employee!, only: %i[new edit create]

  def new; end

  def create
    @output.build_overtime_work(overtime_params)
  end

  private

  def fetch_output
    @output ||= current_employee.outputs.find_or_create_by(date: overtime_params[:date])
  end

  def authenticate_employee!
    redirect_to outputs_path, alert: 'Must be an Employee'
  end

  def overtime_params
    params.require.permit(:work_hrs, :work_num, :date)
  end
end
