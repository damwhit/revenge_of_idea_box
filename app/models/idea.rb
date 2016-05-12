class Idea < ActiveRecord::Base
  validates :quality, inclusion: { in: %w(genius plausible swill),
    message: "%{value} is not a valid quality" }

  def change_quality(quality, change)
    change_up(quality) if change == 'up'
    change_down(quality) if change == 'down'
  end

  def change_up(qual)
    if qual == 'swill'
      self.quality = 'plausible'
    elsif qual == 'plausible'
      self.quality = 'genius'
    else
      self.quality == 'genius'
    end
    self.save
  end

  def change_down(qual)
    if qual == 'genius'
      self.quality = 'plausible'
    elsif qual == 'plausible'
      self.quality = 'swill'
    else
      self.quality == 'swill'
    end
    self.save
  end
end
