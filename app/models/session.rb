class Session < ActiveRecord::Base
  has_many :session_tracks
  has_many :tracks, through: :session_tracks

  def start_time
    start.strftime("%l:%M%p")
  end

  def end_time
    finish.strftime("%l:%M%p")
  end

  def self.tues
    where("start < ?", "9/12/2015")
  end

  def self.wed
    where("start > ?", "9/12/2015")
  end

end
