class SpotlightsController < ApplicationController
  layout "spotlight"
  def show
    @document = Document.order("updated_at DESC").first
  end
end
