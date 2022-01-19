class GoalsController < ApplicationController
  def goal
    @goal = Goal.new
  end

  def fix_and_dalete
  end
end

def create
  @goal = Goal.new(goal_params)  # put into the data from form
  @goal.save
  redirect_to goal_path
end

# for security from here
private

def goal_params
  params[:goal].permit(:title)
end

