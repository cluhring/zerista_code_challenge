require 'test_helper'

class SessionTrackTest < ActiveSupport::TestCase
  attr_reader :sessionA,
              :trackA,
              :trackB,
              :session_track1,
              :session_track2
  def setup
    @sessionA = Session.create(start: "12/8/2015 16:30",
                               finish: "12/9/2015 10:00",
                               name: "T2P3OR5a Clustering")
    @trackA = Track.create(name: "Track A")
    @trackB = Track.create(name: "Track B")
    @session_track1 = SessionTrack.create(session_id: sessionA.id,
                                          track_id: trackA.id)
    @session_track2 = SessionTrack.create(session_id: sessionA.id,
                                          track_id: trackB.id)
  end

  def test_session_track_is_valid
    assert session_track1.valid?
  end

  def test_session_track_belongs_to_a_track
    assert_equal "Track A", session_track1.track.name
    assert_equal "Track B", session_track2.track.name
  end

  def test_session_track_belongs_to_a_session
    assert_equal "T2P3OR5a Clustering", session_track1.session.name
    assert_equal "T2P3OR5a Clustering", session_track2.session.name
  end
end
