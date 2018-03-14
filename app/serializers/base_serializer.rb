class BaseSerializer < ActiveModel::Serializer
  attributes :id

  def id
    object.uuid
  end
end