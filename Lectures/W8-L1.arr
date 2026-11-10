use context dcic2024


data Comment:
    comment(author :: String, text :: String, 
      likes :: Number, replies :: List<Comment>)
end


r1 = comment("@user1", "I am feeling anxious", 4, [list: ])
c1 = comment("@user2", "We are about to get our grades", 15, [list: r1])
c2 = comment("@user3", "One of the greast comebacks!!!", 30, [list: ])
r2 = comment("@user45", "Today is super cold!!! Hot chocolate?", 5, [list: ])
r3 = comment("@user65", "I am very happy today", 3, [list: ])
c3 = comment("@user7", "London's weather is not for everyone", 40, [list: r2, r3])

thread = comment("@user54", "Thunderstorm warning for Thursday", 120, [list: c1, c2, c3])


fun count-comments(c :: Comment) -> Number:
  doc: "how many comments are in a thread"
  1 + count-comments-list(c.replies)
where:
  count-comments(r1) is 1
  count-comments(c3) is 3
  count-comments(thread) is 7
end

fun count-comments-list(cs :: List<Comment>) -> Number:
  doc: "how many comments are in all the threads"
  cases(List) cs:
    | empty => 0
    | link(first, rest) => count-comments(first) + count-comments-list(rest)
  end
end



fun total-likes(c :: Comment) -> Number:
  doc: "total likes on a comment and on every reply below it"
  c.likes + total-likes-list(c.replies)
where:
  total-likes(r1) is 4
  total-likes(c3) is 48
  total-likes(thread) is 217
end

fun total-likes-list(cs :: List<Comment>) -> Number:
  doc: "the likes on every comment in a thread"
  cases(List) cs:
    | empty => 0
    | link(first, rest) => total-likes(first) + total-likes-list(rest)
  end
end








data TaxonomyTree:
  node(rank :: String, name :: String, children :: List<TaxonomyTree>)
end

# Example: Part of the cat family
lion = node("Species", "Panthera leo", [list: ])
tiger = node("Species", "Panthera tigris", [list: ])
leopard = node("Species", "Panthera pardus", [list: ])
panthera = node("Genus", "Panthera", [list: lion, tiger, leopard])

house-cat = node("Species", "Felis catus", [list: ])
wildcat = node("Species", "Felis silvestris", [list: ])
felis = node("Genus", "Felis", [list: house-cat, wildcat])

felidae = node("Family", "Felidae", [list: panthera, felis])



fun count-nodes(t :: TaxonomyTree) -> Number:
   1 + count-nodes-children(t.children)
where:
  count-nodes(lion) is 1
  count-nodes(panthera) is 4
  count-nodes(felis) is 3
  count-nodes(felidae) is 8
end

fun count-nodes-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-nodes(first) + count-nodes-children(rest)
  end
end



fun count-leaves(t :: TaxonomyTree) -> Number:
  cases (List) t.children:
    | empty => 1
    | else => count-leaves-children(t.children)
  end
where:
  count-leaves(lion) is 1
  count-leaves(panthera) is 3
  count-leaves(felis) is 2
  count-leaves(felidae) is 5
end

fun count-leaves-children(c :: List<TaxonomyTree>) -> Number:
  cases (List) c:
    | empty => 0
    | link(first, rest) =>
      count-leaves(first) + count-leaves-children(rest)
  end
end



























