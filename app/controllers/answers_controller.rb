class AnswersController < ApplicationController
  def index
    @answers = current_user.answers
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    @user = current_user
  end

  def new_q
    @answer = Answer.new
    @question = Question.find(params[:id])
    @user = current_user
  end

  def create
    @answer = Answer.new
    @answer.answer_text = params[:answer_text]
    @answer.questioned_on = params[:questioned_on]
    @answer.question_id = params[:question_id]
    @answer.goal_id = params[:goal_id]

    if @answer.save
      redirect_to "/goals/#{@answer.goal_id}", :notice => "Answer created successfully."
    else
      render 'new'
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])

    @answer.answer_text = params[:answer_text]
    @answer.questioned_on = params[:questioned_on]
    @answer.question_id = params[:question_id]
    @answer.goal_id = params[:goal_id]

    if @answer.save
      redirect_to "/answers", :notice => "Answer updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    @answer.destroy

    redirect_to "/answers", :notice => "Answer deleted."
  end
end
