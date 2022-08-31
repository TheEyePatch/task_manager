class OvertimesController < ApplicationController
  before_action :authenticate_employee!
  before_action :fetch_output

  def new; end

  def create
    return redirect_to root_path, alert: ['Work Already Exists!'] if @output.overtime_work

    @overtime = @output.build_overtime_work(overtime_params)
    if @overtime.valid? && @overtime.save
      redirect_to root_path, notice: ['Work Successfully Created!']
    else
      redirect_to root_path, alert: @overtime.errors.full_messages
    end
  end

  def edit
    @overtime_work = Work::Overtime.find(params[:id])
  end

  def update
    @overtime_work = Work::Overtime.find(params[:id])
    @overtime_work.update(overtime_params)

    if  @overtime_work.valid? && @overtime_work.save
      redirect_to root_path, notice: ['Work Updated Successfully']
    else
      redirect_to root_path, alert: @overtime.errors.full_messages
    end
  end

  private

  def fetch_output
    @output ||= current_employee.outputs.find_or_create_by(date: params.dig(:work_overtime, :date))
  end

  def authenticate_employee!
    return redirect_to outputs_path, alert: ['Must be an Employee'] unless employee_signed_in?
  end

  def overtime_params
    params.require(:work_overtime).permit(:work_hrs, :work_num)
  end
end
