class User < ApplicationRecord
  has_many :events, through: :attendees
  has_many :attendees
  has_many :events, :foreign_key => "creator_id"
  has_many :comments
  has_secure_password

  def full_name
    first_name + " " + last_name
  end

  def past_events
    attending_events.where("end_date < ?", current_datetime).order(:start_date)
  end

  def upcoming_events
    attending_events.where("start_date > ?", current_datetime).order(:start_date)
  end

  def ongoing_events
    attending_events.where("start_date < ? AND end_date > ?", current_datetime, current_datetime).order(:start_date)
  end

  private

  def attending_events
    @attending = Attendee.where(user_id: id)
    @my_events = Event.where(id: @attending.pluck(:event_id))
  end
end
