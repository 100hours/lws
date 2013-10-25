class FeedbacksController < ApplicationController
  def show
    @feedback = Feedback.new(subject: "New Request")
  end
  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_url, notice: "Thank you, your feedback has been recorded." }
      else
        format.html { redirect_to :back, warning: "Something went wrong." }
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :email, :body)
  end
end
