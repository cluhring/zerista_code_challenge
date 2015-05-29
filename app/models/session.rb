class Session < ActiveRecord::Base
  has_many :session_tracks
  has_many :tracks, through: :session_tracks

  def start_time
    start.strftime("%d/%m/%Y, %l:%M %p")
  end

  def end_time
    finish.strftime("%d/%m/%Y, %l:%M %p")
  end

end
