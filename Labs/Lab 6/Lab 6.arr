use context dcic2024

#Maia Find



#Task 1

#9.6
3.20 * 3

#"Oat latte"
"Oat" + " " + "latte"

#10
string-length("cappuccino")



#Task 2

latte-price :: Number = 3.2

fun order-cost(n :: Number, c :: Number) -> Number:
  doc: "Returns the cost of an order of drinks"
  n * c
where:
  order-cost(3,3.2) is 9.6
  order-cost(5,latte-price) is 16
end



#Task 3

fun discount-rate(n :: Number) -> Number:
  doc: "Calculates discount rate"
  if n < 5:
    0
  else if n < 10:
    0.1
  else:
    0.2
  end
where:
  discount-rate(4) is 0
  discount-rate(5) is 0.1
  discount-rate(9) is 0.1
  discount-rate(10) is 0.2
end



#Task 4

orders = table: customer, drinks, price
  row: "Amira", 2, 3.20
  row: "Ben", 6, 2.80
  row: "Chen", 12, 3.00
  row: "Dara", 1, 3.50
end


build-column(orders, "cost", lam(c): c["drinks"] * c["price"]end)


filter-with(orders, lam(d): d["drinks"] >= 5end)

#Ben and Chen had 5 or more drinks


#Task 5

drinks-list = orders.get-column("drinks")


fun total-drinks-loop(lst :: List) -> Number block:
  doc: "adds up list using for each loop"
  var total = 0
  for each(drinks from lst):
    total := total + drinks
  end
  total
where:
  total-drinks-loop(drinks-list) is 21
end


fun total-drinks-fold(lst :: List<Number>) -> Number:
  doc: "adds up list using fold"
  fold(lam(drinks, n): drinks + n end, 0, lst)
where:
  total-drinks-fold(drinks-list) is 21
end

check:
  total-drinks-loop(drinks-list) is total-drinks-fold(drinks-list)
end



#Task 6

data Order:
  | eat-in(drinks :: Number)
  | takeaway(drinks :: Number, own-cup :: Boolean)
end


#fun cup-fee(Order):
# doc: "returns cup fee"
# cases (Order):
#   | Order(own-cup, drinks) => 0.25 * drinks
#   | else => 0
#   end
#end









