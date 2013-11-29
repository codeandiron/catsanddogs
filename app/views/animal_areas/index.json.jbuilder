json.array!(@animal_areas) do |animal_area|
  json.extract! animal_area, :forward_sorting_area, :dogs, :cats, :latitude, :longitude
  json.url animal_area_url(animal_area, format: :json)
end
