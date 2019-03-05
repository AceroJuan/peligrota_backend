class WelcomeController < ActionController::API
  def index
    @incidents = Incident.all
    render json: @incidents.map(&:api_format).to_json
  end

  def createIncident
    Incident.create(incident_params)
    render status:200, json: {message: 'ok'}.to_json
  end

  def incidentList
    @incident_list = Incident.order('created_at DESC')[0...5]
    render json: @incident_list.map(&:api_format).to_json
  end

  # Implements a service to do a filter
  def filter
    filter_request = FilterService.new(filter_params)
    result = filter_request.filter
    render json: result.to_json
  end

  private
  def incident_params
    params.permit(:longitude, :latitude, :danger_level, :description, :datetime, :creator_name)
  end

  private
  def filter_params
    params.permit( :datestart, :dateend, :timestart, :timeend, :danger_levels => [])
  end

end
