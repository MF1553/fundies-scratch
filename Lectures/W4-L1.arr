use context dcic2024
include csv



orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(4)) is false
end



fun compute-sum(f-number :: Number, s-number :: Number) -> Number:
  doc:"This function takes two numbers and computes their sum"
  f-number + s-number
where:
  compute-sum(2,3) is 5
  compute-sum(9,9) is 18
  compute-sum(6,7) is 13
end



high-orders = filter-with(orders, is-high-value)

high-orders










