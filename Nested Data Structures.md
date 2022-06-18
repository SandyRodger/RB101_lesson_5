3. <u>Nested Data Structures</u>

```ruby
arr = [[1, 3], [2]]
arr[0][1] #=> 3
```

```ruby
arr = [[1, 3], [2]]
arr[1] = "hi there"
arr                     # => [[1, 3], "hi there"]		
```

Apparently it's importabnt to recognise that in this code:

```ruby
arr = [[1, 3], [2]]
arr[0][1] = 5		
arr # => [[1, 5], [2]]
```

​            It looks like a <u>chained reference</u>, similar to the first example, but it's not. 



The first part, `arr[0]`, is <u>element reference</u> and returns the inner array `[1, 3]`. The second part, `[1] = 5`, is the same as `[1, 3][1] = 5`, which is array <u>element update</u>, not reference. The line `[1, 3][1] = 5` says "change the second element in the array `[1, 3]` to `5`". And as we saw above, this is a destructive action, so the change is permanent. So it's a <u>chained action</u> (not chained reference), but the first part of that chain is element reference, while the second part of that chain is element update.



Also this:

```ruby
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

And this:

```ruby
[{ a: 'ant' }, { b: 'bear' }]
arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]
```

 First we use `arr[0]` to retrieve the first inner hash, so we get `{a: 'ant'}`. Next, we use the normal hash key/value creation syntax to create a new key/value pair: `{a: 'ant'}[:c] = 'cat'`. 

Note:

```ruby
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]              # => ["a", ["b"]]
arr[0][1][0]        # => "b"
arr[1]              # => { :b => "bear", :c => "cat" }
arr[1][:b]          # => "bear"
arr[1][:b][0]       # => "b"
arr[2][2]           # => "b"
```

<u>Variable reference for nested collections</u>

![Variables as Pointers 1](https://d1b1wr57ag5rdp.cloudfront.net/images/collections/variables-as-pointers-1.png)

(Remember: Variables as pointers.)

