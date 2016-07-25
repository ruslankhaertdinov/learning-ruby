class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      redirect_to root_path, notice: "Сообщение успешно отправлено."
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(*Feedback::ATTRIBUTES)
  end
end
