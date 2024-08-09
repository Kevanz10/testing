# frozen_string_literal: true

class ReportsController < ApplicationController
  # TODO: implement report generation endpoint - it should delegate to ReportGenerator

  def get
    if (!validate_date_format(params[:from]) || !validate_date_format(params[:to]) || params["employee_id"].to_i == 0)
      render json: { error: 'Invalid params'}, status: :bad_request
      return false  
    end

    report = ReportGenerator.new(params).call

    if true
      render json: report, status: :ok
    else
      render json: { error: 'Error generating the report' }, status: :unprocessable_entity
    end
  end

  private

  def validate_date_format(date)
    date.match?(/\A\d{4}-\d{2}-\d{2}\z/) || date.match?(/\A\d{2}-\d{2}-\d{4}\z/)
  end
end
