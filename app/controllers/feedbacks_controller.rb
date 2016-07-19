class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    byebug
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      puts "Valid!!!!!!!"
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(*Feedback::ATTRIBUTES)
  end
end
