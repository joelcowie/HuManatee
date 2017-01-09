class Event < ApplicationRecord
  has_many :users, through: :attendees
  has_many :attendees
  belongs_to :creator, :class_name => "User"

  def date_format
    
  end
end
