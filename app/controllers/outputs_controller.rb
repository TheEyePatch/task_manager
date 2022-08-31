class OutputsController < ApplicationController
  before_action :fetch_date_range, only: %i[index]
  before_action :fetch_outputs, only: %i[index update]

  def index
    @output_without_pagination = @outputs
    @outputs = @outputs.page(params[:page]).per(15)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def edit; end

  def update
    @output = @outputs.find(params[:id])
    remarks =
      if params[:remarks_one].present?
       { remarks_one: params[:remarks_one] }
      elsif params[:remarks_two].present?
        { remarks_two: params[:remarks_two] }
      end

    @output.update(remarks)

    if @output.save
      redirect_to root_path
    end
  end

  private

  def fetch_outputs
    @outputs =
    if employee_signed_in?
      current_employee.outputs
                      .includes(:regular_work, :overtime_work, :employee)
                      .with_rich_text_remarks_one
                      .with_rich_text_remarks_two
                      .with_date(@start_date, @end_date)
                      .order(date: :asc)

    elsif reviewer_signed_in?
      Output.includes(:regular_work, :overtime_work, :employee)
            .with_rich_text_remarks_one
            .with_rich_text_remarks_two
            .with_date(@start_date, @end_date)
            .order(date: :asc)
    end
  end

  def fetch_date_range
    @date = params[:date] || 'today'
    if params[:start_date].present? && params[:end_date].present?
      @start_date, @end_date = [params[:start_date].to_date, params[:end_date].to_date]
      return 
    end

    case @date
    when 'yesterday'
      @start_date, @end_date = Date.yesterday, Date.yesterday
    when 'today'
      @start_date, @end_date = Date.current, Date.current
    when 'this_week'
      @start_date = Date.current.beginning_of_week
      @end_date = Date.current
    else
      @start_date, @end_date = Date.current, Date.current
    end
  end
end
