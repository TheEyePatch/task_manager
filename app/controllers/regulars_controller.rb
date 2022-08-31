class RegularsController < ApplicationController
  before_action :authenticate_employee!
  before_action :fetch_output

  def create
    return redirect_to root_path, alert: ['Work already Exists!'] if @output.regular_work

    @work_regular = @output.build_regular_work(regular_params)
    if @work_regular.valid? && @work_regular.save
      redirect_to root_path
    else
      redirect_to root_path, alert: @work_regular.errors.full_messages
    end
  end

  def edit
    @regular_work = Work::Regular.find(params[:id])
  end

  def update
    @regular_work = Work::Regular.find(params[:id])
    @regular_work.update(regular_params)
    if  @regular_work.valid? && @regular_work.save
      redirect_to root_path, notice: ['Work Updated Successfully']
    else
      redirect_to root_path, alert: @work_regular.errors.full_messages
    end
  end

  private

  def fetch_output
    @output ||= current_employee.outputs.find_or_create_by(date: params.dig(:work_regular, :date))
  end

  def authenticate_employee!
    return redirect_to outputs_path, alert: ['Must be an Employee'] unless employee_signed_in?
  end

  def regular_params
    params.require(:work_regular).permit(:work_hrs, :work_num)
  end
end
