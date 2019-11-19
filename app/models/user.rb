class User < ApplicationRecord
    has_many :events
    has_many :event_attendaces, class_name: "EventAttendance"
    has_many :attending_events, :through => :event_attendaces, source: "event"
end
