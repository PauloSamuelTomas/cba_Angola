class MemberSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :gender,
             :birth_date,
             :phone,
             :email,
             :address,
             :status,
             :department_id,
             :choir_id,
             :celula_id


  belongs_to :celula
  belongs_to :department
  belongs_to :choir
end
