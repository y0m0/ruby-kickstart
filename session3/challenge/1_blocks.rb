# Write a method, reverse_map, which invokes a block on each of the elements in reverse order,
# and returns an array of their results.
#
# reverse_map(1, 2, 3) { |i| i * 2 }      # => [6, 4, 2]

def reverse_map(*args, &block)
  res = []
  (args.length - 1).downto(0) do |i|
    res << block.call(args[i])
  end
  res
end
