class User < ApplicationRecord
  has_many :events, through: :attendees
  has_many :attendees
  has_many :events, :foreign_key => "creator_id"
  has_many :comments
  has_many :sent_reviews, :foreign_key => "sender_id", :class_name => "Review"
  has_many :received_reviews, :foreign_key => "receiver_id", :class_name => "Review"
  has_secure_password
  validates :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
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
