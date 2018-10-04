class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :events_attendees, :foreign_key => "attended_event_id", :class_name => "EventsAttendee"
  has_many :attendees, :through => :events_attendees, source: "attendee"
end
