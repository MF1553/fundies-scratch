use context dcic2024



data Footprint:
  | split(name :: String, left :: Footprint, right :: Footprint)
  | activity(name :: String, kg :: Number)
end

car = activity("car", 900)
flights = activity("flight", 1500)
heating = activity("heating", 1100)

travel = split("travel", car, flights)
my-footprint = split("my year", travel, heating)


fun total-CO2(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => total-CO2(left) + total-CO2(right)
    | activity(name, kg) => kg
  end
where:
  total-CO2(car) is 900
  total-CO2(my-footprint) is 3500
end



fun count-splits(fp :: Footprint) -> Number:
  cases(Footprint) fp:
    | split(name, left, right) =>
      1 + count-splits(left) + count-splits(right)
    | activity(name, kg) => 0
  end
where:
  count-splits(car) is 0
  count-splits(my-footprint) is 2
  count-splits(travel) is 1
end














