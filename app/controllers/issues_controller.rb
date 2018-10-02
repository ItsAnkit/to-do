class IssuesController < ApplicationController
  # GET /issues
  # GET /issues.json
  def index
    @issues = Hash.new { |h,k| h[k] = [] }
    Issue.all.each do |issue|
      @issues[issue.state] << issue
    end
    @issues = @issues.sort.to_h
  end

  def update_state
    issue = Issue.find(params[:id])
    issue.update(state: params[:state])
    render json: {}
  end

  def create
    Issue.create(issue_params)
    redirect_to action: :index
  end

  private

  def issue_params
    params.permit(:description, :state)
  end
end
