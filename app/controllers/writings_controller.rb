class WritingsController < ApplicationController
  def index
    @writers = Writer.includes(:documents).all
  end

  def show
    @document =  Document.find(params[:id])
  end
end
