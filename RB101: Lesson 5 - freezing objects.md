https://launchschool.com/lessons/c53f2250/assignments/1a6a2665

The main difference between `clone` and `dup` is that `clone` preserves the frozen state of the object:

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array
```

`dup` does not preserve the frozen state of the object:

```ruby
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```

<u>What is freezing?</u>

​	In Ruby, objects can be frozen in order to precent them from being modified. Only mutable objects can be frozen, becasue immutable objects like integers are already frozen. We can check if an object is frozen with the `frozen?` method. 



```ruby
5.frozen? # => true
```

What does `freeze` actually freeze? `freeze` only freezes the object it's caled on. If the object it's called on contains other objects, those objects won't be frozen. For example, if we have a nested array the nested objects can still be modifies after calling freeze.

```ruby
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]
```

Which also applies to strings in the array:

```ruby
arr = ["a", "b", "c"].freeze
arr[2] << "d"
arr # => ["a", "b", "cd"]	
```

