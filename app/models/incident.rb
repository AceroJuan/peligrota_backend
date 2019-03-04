class Incident < ApplicationRecord
  validates_length_of :description, :maximum => 255

  def api_format
    {
      danger_level: danger_level,
      description: description,
      latitude: latitude,
      longitude: longitude,
      datetime: datetime.strftime("%A, %d %b %Y %l:%M %p")
    }
  end
end
