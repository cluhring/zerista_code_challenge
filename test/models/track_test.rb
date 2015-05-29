require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  attr_reader :trackA, :trackB, :sessionA, :sessionB
  def setup
    @trackA = Track.create(track_name: "Track A")
    @trackB = Track.create(track_name: "Track B")
    @sessionA = Session.create(start: "12/8/2015 16:30",
                               finish: "12/9/2015 10:00",
                               name: "T2P3OR5a Clustering")
    @sessionB = Session.create(start: "12/10/2015 16:30",
                               finish: "12/31/2015 10:00",
                               name: "TPS Reports")
    SessionTrack.create(session_id: sessionA.id, track_id: trackA.id)
    SessionTrack.create(session_id: sessionB.id, track_id: trackA.id)
  end

  def test_track_is_valid
    assert trackA.valid?
    assert_equal "Track B", trackB.track_name
  end

  def test_track_has_many_sessions
    assert_equal 2, trackA.sessions.count
    assert_equal "TPS Reports", trackA.sessions.last.name
  end

  def test_track_has_many_session_tracks
    assert_equal trackA.id, sessionA.session_tracks.first.track_id
  end
end
