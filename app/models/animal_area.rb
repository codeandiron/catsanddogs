class AnimalArea < ActiveRecord::Base
  validates :forward_sorting_area, uniqueness: true, presence: true

  geocoded_by :address

  after_validation :geocode,
    :if => lambda{ |animal_area| animal_area.forward_sorting_area_changed? }

  def address
    "#{forward_sorting_area}, Toronto, Ontario, Canada"
  end

end
