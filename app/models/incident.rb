class Incident < ApplicationRecord
  validates_length_of :description, :maximum => 255
end
