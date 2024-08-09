# frozen_string_literal: true

class ReportGenerator
  # TODO: - fetch range of events and generate Report

  attr_accessor :params

  def initialize(params)
    @params = params
    @employee_id = params[:employee_id]
    @from = Date.parse(params[:from])
    @to = Date.parse(params[:to])
  end

  def call
    Report.new(@employee_id, @from, @to).call
  end
end
