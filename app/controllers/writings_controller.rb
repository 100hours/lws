class WritingsController < ApplicationController
  def index
    @writers = Writer.order('created_at').includes(:documents).all
  end

  def show
    @document =  Document.find(params[:id])
  end
end
