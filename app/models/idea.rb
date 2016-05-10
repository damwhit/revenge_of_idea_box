class Idea < ActiveRecord::Base
  validates :quality, inclusion: { in: %w(genius plausible swill),
    message: "%{value} is not a valid quality" }
end
