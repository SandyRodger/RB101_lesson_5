https://launchschool.com/lessons/c53f2250/assignments/c633cf37

<u>Lesson 5: Advances Ruby Collections:</u> 

4. <u>Working with Blocks</u>

*The return value of `each`is the calling point, which is why this code returns the original array:



```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```



What specific pieces of information are we interested in keeping track of? When evaluating code like this, ask the following questions:

- What is the type of action being performed (method call, block, conditional, etc..)?
- What is the object that action is being performed on?
- What is the side-effect of that action (e.g. output or destructive action)?
- What is the return value of that action?
- Is the return value used by whatever instigated the action?

We can take these pieces of information and set them out in a tabular format:

![Screenshot 2021-12-13 at 12.51.21](/Users/sandyboy/Library/Application Support/typora-user-images/Screenshot 2021-12-13 at 12.51.21.png)

#### Example 2



```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

![Screenshot 2021-12-13 at 12.58.42](/Users/sandyboy/Library/Application Support/typora-user-images/Screenshot 2021-12-13 at 12.58.42.png)

We can see that the change is a result of how `map` handles the return value of the block. Unlike `each`, `map` performs transformation based on the return value of the block. This means the last line in the block -- in this case, `puts` -- is critical to understanding this code.



#### Example 3



```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

| Line | Action               | Object                               | Side-effect                                   | Return Value                                   | Is return value used?                                        |
| ---- | -------------------- | ------------------------------------ | --------------------------------------------- | ---------------------------------------------- | ------------------------------------------------------------ |
| 1    | Method-call(map)     | the outer array                      | none                                          | **New_array = [nil] (error :  = [1, 3])**      | no                                                           |
| 1-4  | block execution      | each sub-array                       | none                                          | nil **error: Integer at index 0 of sub-array** | Yes, used by `map` for transformation                        |
| 2    | method call (first)  | Each sub-array                       | None                                          | Element at index 0 of sub-array                | Yes, used by `puts`                                          |
| 2    | Method call (`puts`) | Element at index 0 of each sub-array | Outputs a string representation of an integer | nil                                            | Yes, used to determine return value of the block               **error: no** |
| 3    | Method call `first`  | Each sub-array                       | none                                          | element at index 0 of mutated array = [nil]    | No error: **Yes, used to determine the return value of block** |





Example 4:

```ruby
1 my_arr = [[18, 7], [3, 12]].each do |arr|
2   arr.each do |num|
3    if num > 5
4      puts num
5    end
6  end
7 end
```

| Line  | Action                                | Object             | Side-effect | Return Value           | Is return value used?                                        |
| ----- | ------------------------------------- | ------------------ | ----------- | ---------------------- | ------------------------------------------------------------ |
| 1     | variable assignment                   | `my_arr`           | none        | [ [18, 7] , [3, 12] ]  | No                                                           |
| 1     | method call, `each`                   | **each sub-array** | none        | **original sub-array** | **No** Actually yes it is used by variable assignment to my_arr |
| 2     | Block execution(Variable assignment?) | First sub-array    | none        | **18** each sub-array  | no                                                           |
| 3 - 5 | comparison operation                  | 18                 | None        | nil                    | Yes, printed 18                                              |
| 3-5   | comparison operation                  | 7                  | none        | nil                    | Print 7                                                      |
| 2     | method call, `each`                   | each sub-array     | none        | 2nd original sub-array | No                                                           |
| 3 - 5 | comparison operation                  | 3                  | None        | nil                    | No                                                           |
| 3 - 5 | comparison operation                  | 12                 | None        | nil                    | Yes, printed 12                                              |

```ruby
1[[1, 2], [3, 4]].map do |arr|
2  arr.map do |num|
3    num * 2
4  end
5end
```

| Line | Action                | Object                        | Side Effect | Return Value          | Is Return Value Used?                             |
| ---- | --------------------- | ----------------------------- | ----------- | --------------------- | ------------------------------------------------- |
| 1    | method call (`map`)   | Original array                | None        | New transformed array | No                                                |
| 1-5  | outer block execution | Each sub-array                | None        | New transformed array | Yes, used by top-level `map` for transformation   |
| 2    | method call (`map`)   | Each sub-array                | None        | New transformed array | Yes, used to determine outer block's return value |
| 2-4  | inner block execution | Element within each sub-array | None        | An integer            | Yes, used by inner `map` for transformation       |

Example 6:

```ruby
1[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
2  hash.all? do |key, value|
3    value[0] == key.to_s
4  end
5end
# => [{ :c => "cat" }]
```



| Line | Action                | Object                                                     | Side Effect | Return Value      | Is Return Value Used?                                        |
| ---- | --------------------- | ---------------------------------------------------------- | ----------- | ----------------- | ------------------------------------------------------------ |
| 1    | method call (select)  | array of hashes                                            | none        | [{ :c => "cat" }] | No                                                           |
| 1-5  | Outer block execution | each hash in the array if hashes                           | none        | boolean           | Yes, it is passed to the select method for selection         |
| 2    | method call 'all?'    | Each hash in the array of hashes                           | none        | boolean           | Yes, it is passed to select                                  |
| 2-4  | Inner block execution | each key value pair in the array                           | none        | boolean           | yes                                                          |
| 3    | index accesser        | the object at index 0 of each value of each key value pair | none        | a single letter   | yes, it is compared with key.to_s to determine  the boolean value |



<u>Example 7: Sorting nested data structures:</u>

```ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]		
```

Example 8: working with different objects in a nested array:	

```ruby
 [[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
```

Example 9:

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```

Example 10:

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

| Line | Action                      | Object                       | Side Effect | Return Value               | Is Return Value Used?                                   |
| ---- | --------------------------- | ---------------------------- | ----------- | -------------------------- | ------------------------------------------------------- |
| 1    | method call (map)           | Multi-dimentional-array      | none        | [[[2, 3], [4, 5]], [6, 7]] | no                                                      |
| 1-11 | Outer-block execution       | Multi-dimentional-array      | None        | Arrays of n + 1            | yes , it's passed to .map for transformation            |
| 2-10 | Middle-block execution      | both sub-arrays from liner 1 | none        | Arrays of n + 1            | yes , it's passed to .map for transformation            |
| 3    | if conditional operator     | both sub-arrays from liner 1 | None        | boolean                    | Yes, it's used to decide whether to pass to line 4 or 6 |
| 3    | method call (.to_s)         |                              |             |                            |                                                         |
| 3    | Method call (size)          |                              |             |                            |                                                         |
| 3    | comparison operator (==)    |                              |             |                            |                                                         |
| 4    | method call (addition)      |                              |             |                            |                                                         |
| 5    | 'else' conditional operator |                              |             |                            |                                                         |
| 6    | method call (.map)          |                              |             |                            |                                                         |
| 7    | method call ('addition')    |                              |             |                            |                                                         |
|      |                             |                              |             |                            |                                                         |
