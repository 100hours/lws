class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :writer, :title, :body
end
