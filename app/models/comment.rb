class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def commenter
    User.find(self.user_id).full_name
  end
end
