class SessionsController < ApplicationController
  def tuesday
    @sessions = Session.tues
    @tracks = Track.all
  end

  def wednesday
    @sessions = Session.wed
    @tracks = Track.all
  end
end
