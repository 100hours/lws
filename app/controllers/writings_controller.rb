class WritingsController < ApplicationController
  def index
    @documents = Document.where(archived: true)
  end

  def show
    @document =  Document.find(params[:id])
  end
end
