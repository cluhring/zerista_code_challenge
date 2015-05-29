require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  attr_reader :sessionA, :trackA, :trackB
  def setup
    @sessionA = Session.create(start: "12/8/2015 16:30",
                               finish: "12/9/2015 10:00",
                               name: "T2P3OR5a Clustering")
    @trackA = Track.create(name: "Track A")
    @trackB = Track.create(name: "Track B")
    SessionTrack.create(session_id: sessionA.id, track_id: trackA.id)
    SessionTrack.create(session_id: sessionA.id, track_id: trackB.id)
  end

  def test_session_is_valid
    assert sessionA.valid?
    assert_equal "T2P3OR5a Clustering", sessionA.name
  end

  def test_session_has_many_tracks
    assert_equal 2, sessionA.tracks.count
    assert_equal "Track A", sessionA.tracks.first.name
  end

  def test_session_has_many_session_tracks
    assert_equal sessionA.id, sessionA.session_tracks.first.session_id
  end

  def test_start_and_end_time_strftime_methods_work
    assert_equal "12/09/2015, 10:00 AM", sessionA.end_time
    assert_equal "12/08/2015,  4:30 PM", sessionA.start_time
  end

end
