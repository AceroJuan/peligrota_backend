class Incident < ApplicationRecord
  validates_length_of :description, :limit => 255
end
