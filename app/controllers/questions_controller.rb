class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @user = current_user
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def new_g
    @question = Question.new
    @goal = Goal.find(params[:id])
    @user = current_user
  end

  def create_question_g
    @goal = Goal.find(params[:goal_id])
    @question = Question.new
    @question.cadence = params[:cadence]
    @question.question_text = params[:question_text]
    @question.goal_id = params[:goal_id]

    if @question.save
      redirect_to "/goals/#{@goal.id}"
    else
      render 'new'
    end
  end

  def create
    @question = Question.new
    @question.cadence = params[:cadence]
    @question.question_text = params[:question_text]
    @question.goal_id = params[:goal_id]

    if @question.save
      redirect_to "/questions", :notice => "Question created successfully."
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    @question.cadence = params[:cadence]
    @question.question_text = params[:question_text]
    @question.goal_id = params[:goal_id]

    if @question.save
      redirect_to "/questions", :notice => "Question updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.answers.destroy_all
    @question.destroy

    redirect_to "/questions", :notice => "Question and all associated answers deleted."
  end
end
