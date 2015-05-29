class SessionTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :session
end
