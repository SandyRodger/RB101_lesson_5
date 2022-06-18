# Practice Problems: Sorting, Nested Collections and Working with Blocks

#### Practice Problem 7 - I got really wrong.

Given this code, what would be the final values of `a` and `b`? Try to work this out without running the code.

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```

```ruby
a # => 2
b # => [3, 8]
```

​	The value of `a` didn't change because we are not referencing `a` at any point. This code `arr[0] += 2` was modifying the array, `arr` not `a`. In effect we are assigning a new object at that index of the array so that instead of `arr[0]` containing `a` it now contains `4` - we can check this by looking at the value of `arr`:

