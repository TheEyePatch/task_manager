class OutputsController < ApplicationController
  before_action :fetch_date_range, only: %i[index]
  before_action :fetch_outputs, only: %i[index update]

  def index; end

  def edit; end

  def update
    @output = @outputs.find(params[:id])
    @output.update(remarks_one: params[:remarks_one])

    if @output.save
      redirect_to root_path
    end
  end

  protected

  def fetch_outputs
    @outputs =
    if employee_signed_in?
      current_employee.outputs
                      .includes(:regular_work, :overtime_work, :employee)
                      .with_rich_text_remarks_one
                      .with_rich_text_remarks_two
                      .with_date(@start_date, @end_date)
    elsif reviewer_signed_in?
      Output.includes(:regular_work, :overtime_work, :employee)
            .with_rich_text_remarks_one
            .with_rich_text_remarks_two
            .with_date(@start_date, @end_date)
    end
  end

  def fetch_date_range
    @date = params[:date]
    if params[:start_date].present? && params[:end_date].present?
      @start_date, @end_date = params[:start_date].to_date, params[:end_date].to_date
    elsif @date == 'yesterday'
      @start_date, @end_date = Date.yesterday, Date.yesterday
    elsif @date == 'today' || params[:date].blank?
      @start_date, @end_date = Date.current, Date.current
    end
  end
end
