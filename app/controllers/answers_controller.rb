class AnswersController < ApplicationController
  before_action :find_question, only:[:create, :destroy]
  def create
    @answer = @question.answers.new(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
    redirect_to question_path(@question)
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.delete
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

end
