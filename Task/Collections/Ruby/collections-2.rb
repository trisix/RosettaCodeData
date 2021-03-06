# creating an empty hash

h = {}            # => {}
h["a"] = 1        # => {"a" => 1}
h["test"] = 2.4   # => {"a" => 1, "test" => 2.4}
h[3] = "Hello"    # => {"a" => 1, "test" => 2.4, 3 => "Hello"}

# creating a hash with the constructor
h = Hash.new      # => {}
