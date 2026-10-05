import file("lab2-support.arr") as support

support.encryptor1("Hi")
support.encryptor2("abcdefghijklmnop")
support.encryptor3("12345")
support.encryptor4("Hellooo")
support.encryptor5("abcdefghijklmnopqrstuvwxyz")
support.encryptor6("Hello")
support.encryptor7("Hello")
support.encryptor8("Hi")
support.encryptor9("Hello")
support.encryptor10("Hello")


fun my-encryptor1(s :: String):
  string-repeat(s, 5)
end

my-encryptor1("Yo")

support.test-encryptor1(my-encryptor1)


fun my-encryptor2(s :: String):
  string-substring(s, 0, 4)
end

my-encryptor2("What's up")

support.test-encryptor2(my-encryptor2)



fun my-encryptor4(s :: String):
    string-repeat(string-substring(s, 0, 4), 5)
end

my-encryptor4("What's up")

support.test-encryptor4(my-encryptor4)





fun my-encryptor7(s :: String):
  string-length(s)
end

my-encryptor7("What's up")

support.test-encryptor7(my-encryptor7)




