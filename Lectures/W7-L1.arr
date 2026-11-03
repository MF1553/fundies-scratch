use context dcic2024



week-temps = [list: 28, 31, 34, 29, 30, 26, 32]
CO2 = [list: 411.65, 414.21, 416.41, 418.53, 421.08, 424.61, 427.35]

fun hot-days(temps :: List<Number>) -> List<Number>:
  doc: "keeps the temperatures of 30 or more"
  cases (List) temps:
    | empty => empty
    | link(f, r) =>
      if f >= 30:
        link(f, hot-days(r))
      else:
        hot-days(r)
      end
  end
where:
  hot-days(week-temps) is [list: 31, 34, 30, 32]
  hot-days([list: 29, 25]) is [list: ]
  hot-days([list: ]) is [list: ]
end


fun yearly-rise(levels :: List<Number>) -> List<Number>:
  doc: "how much each level rose from the one before it"
  cases (List) levels:
    | empty => empty
    | link(f, r) =>
      cases(List) r:
        | empty => empty
        | link(next-year, rest) => link(next-year - f, yearly-rise(r))
      end
  end
where:
  yearly-rise([list: 411.65, 414.21, 416.41]) is [list: 2.56, 2.2]
  yearly-rise([list: 400]) is [list: ]
  yearly-rise([list: ]) is [list: ]
end


fun hottest(temps :: List<Number>) -> Number:
  doc: "the highest temperature in a list; not defined for an empty list"
  cases (List) temps:
    | empty => raise("no temperatures given")
    | link(f, r) =>
      cases (List) r:
        | empty => f
        | else => num-max(f, hottest(r))
      end
  end
where:
  hottest(week-temps) is 34
  hottest([list: -3, -1, -5]) is -1
  hottest([list: 15]) is 15
  hottest(empty) raises "no temperature"
end
















