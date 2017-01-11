class Event < ApplicationRecord
  has_many :users, through: :attendees
  has_many :attendees
  belongs_to :creator, :class_name => "User"

  def date_format
    if start_date.strftime('%B %d, %Y') == end_date.strftime('%B %d, %Y')
      start_date.strftime('%B %d, %Y')
    else
      "#{start_date.strftime('%B %d, %Y')} - #{end_date.strftime('%B %d, %Y')}"
    end
  end

  def time_format
    start_hour = start_date.strftime('%I').to_i < 10 ? start_date.strftime('%I')[1] : start_date.strftime('%I')

    end_hour = end_date.strftime('%I').to_i < 10 ? end_date.strftime('%I')[1] : end_date.strftime('%I')

    start_hour + start_date.strftime(':%M %p') + " - " + end_hour + end_date.strftime(':%M %p')
  end

  def organizer
    User.find(self.creator_id) if self.creator_id
  end

  def past_event?
    end_date < current_datetime
  end

  def self.past_events
    self.where("end_date < ?", current_datetime).order(:start_date)
  end

  def self.upcoming_events
    self.where("start_date > ?", current_datetime).order(:start_date)
  end

  def self.ongoing_events
    self.where("start_date < ? AND end_date > ?", current_datetime, current_datetime).order(:start_date)
  end
end
