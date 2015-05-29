class Track < ActiveRecord::Base
  has_many :session_tracks
  has_many :sessions, through: :session_tracks
end
