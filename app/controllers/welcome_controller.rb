class WelcomeController < ActionController::API
  def index
    @incidents = Incident.all
    render json: @incidents.to_json
  end

  def createIncident
    Incident.create(indicent_params)
    render status:200, json: {message: 'ok'}.to_json
  end

  def incidentList
    @incident_list = Incident.order('created_at DESC')[0...5]
    render json: @incident_list.to_json
  end

  # Implements a service to do a filter
  def Filter
  end

  private
  def incident_params
    params.require(:incidents).permit(:longitude, :latitude, :danger_level, :description, :datetime, :creator_name)
  end

end
