class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :event_attendances, class_name: "EventAttendance"
    has_many :attendees, :through => :event_attendances, source: "user"
end
