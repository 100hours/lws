class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :writer, :title, :body, :updated_at
end
