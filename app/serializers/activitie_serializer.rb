class ActivitieSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :date,
             :time,
             :location,
             :objective,
             :department_id,
             :choir_id,
             :organizer

  has_many :schedules
end
