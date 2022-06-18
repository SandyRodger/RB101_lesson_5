<u>Shallow copy:</u> Sometimes you'll find yourself in need of copying an entire collection ( mostly when we want to save the original collection before performing some major modifications). Ruby provides two methods that let us copy an object, including collections: dup and clone. Both of thes methods create a *shallow copy* of an object - like a nested array - then those objects will be shared, not copied. This has major impact to nested collections.



```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]
```

`clone` works the same way

```ruby
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]
```



Is a *shallow copy* comparable to a URL? It can be copied, but it points to the same thing?

It is important to understand that the reason this happens is because the destructive methods `String#upcase!` and `String#reverse!` were called on the object within the array rather than the array itself. Those objects are shared, even if you mutate that object by referencing it from within a particular array or other collection it is the object you are affecting rather than the collection.



```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```

 So here we have mutated the array itself, not the objects within the array.

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```

Whereas here the `each` method takes each object within the array and modifies that, so both arrays are mutated.



It is important to be aware of exactly what level you're working at, especially when working with nested collections and using variables as pointers; are you working at the level of an outer array or hash, or at the level of an object within that?

​	Is the bottle blue glass or the liquid within blue liquid.