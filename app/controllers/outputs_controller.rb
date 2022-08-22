class OutputsController < ApplicationController
  before_action :authenticate_user!

  def index
    @outputs = Output.all
  end
end
