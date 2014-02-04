class Writeroom::DocumentsController < WriteroomController

  respond_to :html
  respond_to :json, only: [:update]

  def index
    @documents = Document.where(archived: false)

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

    if @document.update(document_params)
      Pusher.trigger(pusher_channel, 'patch', 
                     { id:         @document.id.to_s })
    end
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
      .permit(:title, :body, :requester)
  end

  def pusher_channel
    "#{Rails.env}_main_channel"
  end
  
end
