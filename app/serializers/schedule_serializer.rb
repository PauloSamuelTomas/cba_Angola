class ScheduleSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :date,
             :time,
             :status


  belongs_to :activity
end
