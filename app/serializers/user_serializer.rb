class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :role

  has_many :news


  def role
    object.role
  end
end
