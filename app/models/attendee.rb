class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :user

  def self.active_volunteers
    self.group(:user_id).order("COUNT(user_id) DESC").limit(3).count
  end

  def self.popular_events
    self.group(:event_id).order("COUNT(event_id) DESC").limit(3).count
  end
end
