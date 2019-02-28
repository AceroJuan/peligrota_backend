class WelcomeController < ActionController::API
  def index
    @incidents = Incident.all
  end

  def createIncident
    Incident.create(params)
  end

  def incidentList
    @incident_list = Incident.order('created_at DESC')[0...5]
  end

  # Implements a service to do a filter
  def Filter
  end

end
