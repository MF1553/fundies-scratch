use context dcic2024
include csv
include data-source

workouts = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end
workouts

first-row = workouts.row-n(0)
first-row

first-row["activity"]
workouts.row-n(0)["duration"]

workouts.length()

workouts.get-column("activity")


recipes = load-table:
  title :: String, 
  servings :: Number, 
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

recipes

recipes.length()

mean(recipes, "prep-time")
median(recipes, "prep-time")
sum(recipes, "prep-time")
stdev(recipes, "prep-time")
modes(recipes, "prep-time")

labeled-scatter-plot(recipes, "title", "prep-time", "servings")
