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

    start_hour + start_date.strftime(':%M%p') + " - " + end_hour + end_date.strftime(':%M%p')

    # if start_date.strftime('%I').to_i < 10
    #   start_date.strftime('%I')[1] + start_date.strftime(':%M%p') + " - " + end_date.strftime('%I') + end_date.strftime(':%M%p')
    # elsif
    # else
    #   "#{start_date.strftime('%I:%M%p')} - #{end_date.strftime('%I:%M%p')}"
    # end
  end

  def past_event?
    end_date < current_datetime
  end

end
