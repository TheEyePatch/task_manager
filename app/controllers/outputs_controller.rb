class OutputsController < ApplicationController
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
    elsif reviewer_signed_in?
      Output.includes(:regular_work, :overtime_work, :employee)
            .with_rich_text_remarks_one
            .with_rich_text_remarks_two
    end
  end
end
