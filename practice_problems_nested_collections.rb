# PROBLEM 1

# arr = ['10', '11', '9', '7', '8']

# arr_clone = arr.each {|n|n.to_i}
# arr_clone.sort
# arr_clone.map {|n|n.to_s}

# p arr_clone
# p arr

# # OR

# arr = ['10', '11', '9', '7', '8']
# p arr2 = arr.dup
# arr2 = arr2.map {|n| n.to_i}
# p arr2.sort!
# arr2 = arr2.map {|n| n.to_s}
# p arr2

# OR

# arr = ['10', '11', '9', '7', '8']
# arr_2 =[]

# arr.each do |num|
#   arr_2 << num.to_i
# 	arr_2.sort_by! {|a,b| b <=> a}
# end

# p arr_2

# LS solution:

# arr.sort do |a,b|
#   b.to_i <=> a.to_i
# end
# => ["11", "10", "9", "8", "7"]

# PROBLEM 2

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by! do |hash|
# 	hash[:published]
# end                  # => LS solution exactly the same!!!!!

# PROBLEM 3
 
# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# p 'g' == arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# p 'g' == arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# p 'g' == arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# p 'g' == hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p 'g' == hsh2[:third].key(0)

# PROBLEM 4

# arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4
# #  p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[-1]=4
# # p arr2

# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0]=4
# # p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2]=4
# # p hsh2

# PRACTICE PROBLEM 5:

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# total= 0

# munsters.each do |k,v| 
# 	if v["gender"] == "male"
# 		total += v["age"]
# 	end
# end

# p total             #=> LS solution similar to mine

# PRACTICE PROBLEM 6:

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |k,v|
#  puts "#{k} is a #{v['age']}-year-old #{v['gender']}."
# end

# PRACTICE PROBLEM 7

# a = 2
# b = [5, 8]
# arr = [a, b]

# arr[0] += 2
# arr[1][0] -= a

# a = 4 WRONG = 2
# b = 1  WRONG = [3, 8]

#  PRACTICE PROBLEM 8

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each do |k, v|
# 	v.each do |word| 
# 		word.each_char do |letter|
# 			if letter =~/[aeiou]/
# 				p letter
# 			end
# 		end
# 	end
# end

# # LS solution:   Very similar.

# vowels = 'aeiou'

# hsh.each do |_, value|
#   value.each do |str|
#     str.chars.each do |char|
#       puts char if vowels.include?(char)
#     end
#   end
# end

# PRACTICE PROBLEM 9

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# arr.each do |array|
# 	array.sort!.reverse!
# end

# LS solution:

# arr.map do |sub_arr|
#   sub_arr.sort do |a, b|
#     b <=> a
#   end
# end

# PRACTICE PROBLEM 10

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr.map do |hash|
# 	hash.each do |k,v| 
# 		hash[k] = v + 1 
# 	end
# end

# # LS solution: (Mine's shorter)

# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
#   incremented_hash = {}
#   hsh.each do |key, value|
#     incremented_hash[key] = value + 1
#   end
#   incremented_hash
# end

# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# PRACTICE PROBLEM 11

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# arr_2 = arr.clone

# arr_2.map do |array|
# 	array.reject! {|num| num % 3 != 0 }
# end

# # LS solution: Very similar, without the clone.

# arr.map do |element|
#   element.reject do |num|
#     num % 3 != 0
#   end
# end

# PRACTICE PROBLEM 12:

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# hash = Hash.new 

# arr.each do |array|
# 	hash [array[0]] = array[1]
# end
# p hash

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# LS solution same as mine.

#  PRACTICE PROBLEM 13	

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# sorted_arr =  arr.map.sort_by do |arr|
# 	arr.select do |num| 
# 		num.odd?
# 	end
# end

# p sorted_arr
# # expected return value:  [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# # LS solution: There was no need for my .map

# arr.sort_by do |sub_arr|
#   sub_arr.select do |num|
#     num.odd?
#   end
# end

#PRACTICE PROBLEM 14:

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# new_arr = []

# hsh.each do |_, v|
# 	if v[:type] == 'fruit'
# 		new_arr << v[:colors].map {|word| word.capitalize!}
# 	else 
# 		new_arr << v[:size].upcase!
# 	end
# end

# p new_arr

# # expected output: [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# # LS solution:  (longer than mine)

# hsh.map do |_, value|
#   if value[:type] == 'fruit'
#     value[:colors].map do |color|
#       color.capitalize
#     end
#   elsif value[:type] == 'vegetable'
#     value[:size].upcase
#   end
# end
# # => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# PRACTICE PROBLEM 15:

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
# new_arr = []

# arr.map do |hsh|
# 	marker = true
# 	hsh.each do |_,v|
# 		v.each do |num|
# 			if num.odd?
# 				marker = false
# 			end
# 		end
# 	end
# 	if marker then new_arr << hsh
# 	end
# end

# p new_arr

# LS solution:

# arr.select do |hsh|
#   hsh.all? do |_, value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end
# # => [{:e=>[8], :f=>[6, 10]}]

# PRACTICE PROBLEM 16:

# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# 8-4-4-4-12 



def uuid
	n = 'abcdefghijklmnopqrstuvwxyz1234567890'
	output = ""
	8.times {output << n[Random.rand(35)]}
	output << "-"
	4.times {output << n[Random.rand(35)]}
	output << "-"
	4.times {output << n[Random.rand(35)]}
	output << "-"
	4.times {output << n[Random.rand(35)]}
	output << "-"
	12.times {output << n[Random.rand(35)]}
	puts output
end

uuid

# LS solution:

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
