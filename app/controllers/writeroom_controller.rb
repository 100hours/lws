class WriteroomController < ApplicationController
  layout "write_room"
  http_basic_authenticate_with name: ENV['WRITEROOM_USERNAME'], password: ENV['WRITEROOM_PASSWORD']
end
