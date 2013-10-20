class Writeroom::DocumentsController < ApplicationController
  http_basic_authenticate_with name: ENV['WRITEROOM_USERNAME'], password: ENV['WRITEROOM_PASSWORD']

  respond_to :html, :json

  def index
    @documents = Document.all

    respond_with @documents
  end

  def show
    @document = Document.find(params[:id])

    respond_with @document
  end

  def new
    @document = Document.new

    respond_with @document
  end

  def edit
    @document = Document.find(params[:id])

    respond_with @document
  end

  def create
    @document = Document.new(params[:document])
    flash[:notice] = "The new document was successfully created" if @document.save

    respond_with @document
  end

  def update
    @document = Document.find(params[:id])

    @document.update(params[:document])
    respond_with @document
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to action: "index" }
      format.json { head :no_content }
    end
  end
end
