class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def current_datetime
    DateTime.now.utc
  end

  def self.current_datetime
    DateTime.now.utc
  end
end
