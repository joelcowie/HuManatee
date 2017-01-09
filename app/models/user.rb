class User < ApplicationRecord
  has_many :events, through: :attendees
  has_many :attendees
  has_many :events, :foreign_key => "creator_id"
  has_secure_password

  def full_name
    first_name + " " + last_name
  end
end
