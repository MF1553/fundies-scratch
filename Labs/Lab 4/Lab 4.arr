use context dcic2024
include csv
include data-source


flights = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number, 
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number, 
  tailnum :: String, 
  origin :: String, 
  dest :: String,
  air_time :: Number, 
  distance :: Number,
  hour :: Number,
  minute :: Number, 
  time_hour :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end


fun is_long_flight(row :: Row) -> Boolean:
  row["distance"] >= 1500
end

long_flights = order-by(filter-with(flights, is_long_flight), "air_time", false)
long_flights


long_flights.row-n(0)["carrier"] + "|" + long_flights.row-n(0)["origin"] + "|" + long_flights.row-n(0)["dest"]



fun is_delayed_departure(row :: Row) -> Boolean:
  row["dep_delay"] >= 30
end

fun is_morning_sched_dep(row :: Row) -> Boolean:
  row["sched_dep_time"] < 1200
end









