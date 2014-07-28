json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :table, :start, :finish
  json.url reservation_url(reservation, format: :json)
end
