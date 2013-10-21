class Writeroom::DocumentsController < ApplicationController
  http_basic_authenticate_with name: ENV['WRITEROOM_USERNAME'], password: ENV['WRITEROOM_PASSWORD']
  layout "write_room"

  respond_to :html
  respond_to :json, only: [:update]

  def index
    @documents = Document.all

    respond_with @documents
  end

  def show
    redirect_to action: "edit"
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
    @document = Document.new(document_params)
    flash[:notice] = "The new document was successfully created" if @document.save

    redirect_to edit_writeroom_document_path(@document)
  end

  def update
    @document = Document.find(params[:id])

    @document.update(document_params)
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

  private

  def document_params
    params
      .require(:document)
      .permit(:title, :body)
  end
end
