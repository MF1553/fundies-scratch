use context dcic2024

import math as M
import statistics as S


cafe-data =
  table: day, drinks-sold
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

cafe-data

sales = cafe-data.get-column("drinks-sold")

sales

M.max(sales)
S.mean(sales)
S.median(sales)
M.sum(sales)

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "NONE"]
unique-codes = distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = filter(is-real-code, unique-codes)
first-code = real-codes.get(0)
lower-codes = map(string-to-lower, real-codes)


distinct(filter(is-real-code, map(string-to-lower, discount-codes)))


#ascending
sales.sort()

#descending
sales.sort().reverse()


var total = 1
total := total + 10

total



fun my-sum(num-list :: List) -> Number block:
  doc: "insert docstring here"
  var running = 0
  for each(n from num-list):
      running := running + n
  end
  running
where:
  my-sum([list: 0, 1, 2, 3]) is 6
  my-sum([list: ]) is 0
end





