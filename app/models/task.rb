class Task < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true

  #order all tasks by their created_at date, OLDEST first
  default_scope { order('created_at ASC') }

  def days_left
    7-(DateTime.now.to_date - created_at.to_date).to_i
  end

end
