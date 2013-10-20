class Api::V1::DocumentsController < ApplicationController
  respond_to :json

  def index
    respond_with Document.all
  end

  def show
    respond_with Document.find(params[:id])
  end

  private

  def document_params
    params.require(:document).permit(:title, :body)
  end
end
