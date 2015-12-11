class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
    @questions = @goal.questions
  end

  def new
    @goal = Goal.new

  end

  def create
    @goal = Goal.new
    @goal.user_id = params[:user_id]
    @goal.goal_text = params[:goal_text]

    if @goal.save
      redirect_to "/goals", :notice => "Goal created successfully. Now add questions for your goal."
    else
      render 'new'
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    @user_id = current_user.id
  end

  def update
    @goal = Goal.find(params[:id])

    @goal.user_id = params[:user_id]
    @goal.goal_text = params[:goal_text]

    if @goal.save
      redirect_to "/goals", :notice => "Goal updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])

    @goal.questions.destroy_all

    @goal.answers.destroy_all

    @goal.destroy

    redirect_to "/goals", :notice => "Goal and all associated questions and answers deleted."
  end
end
