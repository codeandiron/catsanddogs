class AnimalArea < ActiveRecord::Base
  validates :forward_sorting_area, uniqueness: true, presence: true
end
