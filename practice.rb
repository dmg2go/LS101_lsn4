# => RB101 Programming Foundations
# => Lesson 4 Ruby Collectons
# => January 24, 2019
# => David George 
# => dmg2go@gmail.com

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'}

def select_fruit(product_hash)
  product_hash.select {|k, v| v == 'Fruit'}
end

p select_fruit(produce)


# => More and More Methods - Feb 4

rtrn1 = [1, 2, 3].select do |num|
  num > 5
  'hi'
end
p rtrn1


rtrn2 = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
p rtrn2


# returns all array elements because puts num is falsy and 
# reject returns elements where block evals to false
rtrn3 = [1, 2, 3].reject do |num|
  puts num
end
p rtrn3


rtrn4 = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
p rtrn4


# => returns first key/val pair as array ['a', 'ant'], original hash is modified
rtrn5 = { a: 'ant', b: 'bear' }
p rtrn5.shift

p rtrn5


# => returns 11 - the size of the returned (popped) element
rtrn6 = ['ant', 'bear', 'caterpillar'].pop.size
p rtrn6


# => returns true because num.odd? evals to true at least once
# => block also outputs 1 because any? exists once true
rtrn7 = [4, 7, 2, 3].any? do |num|
  puts num
  num.odd?
end
p rtrn7


# => returns first two elements, not destructive, 
rtrn8 = [1, 2, 3, 4, 5]
new_ary = rtrn8.take(2)
p new_ary
p rtrn8



# =>  returns an array with element for each hash value eval'd by if
# =>  where the if is true, value is added to new array, where if is false, nil is added
rtrn9 = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value + key.to_s
  end
end
p rtrn9


# => returns new array [1, nil, nil], by virtue of eval of if/else
rtrn10 = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
p rtrn10


# => Practice Problems: Additional Practice


rtrn1 = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"].map.with_index do |o, i|
  [o, i]
end
rtrn1.to_h
p rtrn1


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
combined_ages = 0
rtrn2 = ages.each_value {|v| combined_ages += v}
p rtrn2
p combined_ages


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
rtrn3 = ages.reject do |k, v|
  v >= 100
end
p rtrn3


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
rtrn3 = ages.select do |k, v|
  v < 100
end
p rtrn3


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
rtrn4 = ages.min {|a, b| a <=> b}
p rtrn4
rtrn4 = ages.invert
p rtrn4
p rtrn4.max {|a, b| a <=> b}
rtrn4 = rtrn4.values
p rtrn4
p rtrn4.min {|a, b| a <=> b}
p rtrn4.max {|a, b| a <=> b}


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
rtrn5 = flintstones.index {|w| w.start_with? 'Be' }
p rtrn5

# => map and collect build new arrays with return vals of block, filter only checks truthy
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
rtrn6 = flintstones.collect {|w| w.slice(0, 3) }
p rtrn6



statement = "The Flintstones Rock"
char_ary = statement.chars
counts = Hash.new
char_ary.each do |v| 
  if counts.has_key?(v) 
    counts.merge!({v => counts[v] + 1})
  else 
    counts.store(v, 1)
  end
end
p counts
p rtrn7


numbers = [1, 2, 3, 4]
p numbers
numbers.each do |number|
  p number
  numbers.shift(1)
  #p goner
end
p numbers

numbers = [1, 2, 3, 4]
p numbers
numbers.each do |number|
  p number
  numbers.pop(1)  
end
p numbers


words = "the flintstones rock"
cap_words = ''
w_ary = words.split(' ')
w_ary.each do |w| 
  w.capitalize!
  cap_words << w + " "
end
cap_words.rstrip!
p w_ary
p cap_words



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |k, v|
  case v["age"]
  when 0 .. 17 
    v["age_group"] = "kid"
  when 18 .. 64 
    v["age_group"] = "adult"
  when  65 .. nil
    v["age_group"] = "senior"
  end
end
p munsters



numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
number = 0

until number == numbers.size
  odd_numbers << numbers[number] if number.to_i.odd?

  number += 1
end




numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
counter = 0

loop do
  number = numbers[counter].to_i

  odd_numbers << numbers[counter] unless number.even?

  counter += 1
  break if counter == numbers.size
end


numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

numbers.each do |number|
  odd_numbers << number if number.to_i.odd?
end

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

for number in numbers
  if number.to_i.odd?
    odd_numbers.push(number)
  end
end
p odd_numbers




numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size

loop do
  number = numbers[-counter]
  for num in 1..number
    puts num
  end

  break if counter == 1
  counter -=1
end





numbers = [7, 3, 5, 2, 1, 8, 4]
counter = 0

loop do
  number = numbers[counter]
  counter = 0

  loop do
    counter += 1
    puts counter

    break if counter >= number
  end
  puts ''
  counter += 1
  break if counter >= numbers.size
end



numbers = [7, 3, 5, 2, 1, 8, 4]

for number in numbers
  counter = 0

  loop do
    counter += 1
    puts counter

    break if counter >= number
  end
end



numbers = [7, 3, 5, 2, 1, 8, 4]

numbers.each do |number|
  counter = 0
  number.times do
    counter += 1
    puts counter
  end
end
puts ''

numbers = [7, 3, 5, 2, 1, 8, 4]
counter = numbers.size

loop do
  number = numbers[-counter]
  for num in 1..number
    puts num
  end

  break if counter == 1
  counter -=1
end

hsh = {a: 'apple', b: 'pear', c: 'orange', d: 'kiwi', e: 'banana'}
counter = 0

new_hsh = {}

for letter, fruit in hsh
  new_hsh[letter] = fruit if fruit.size > 4
end

p new_hsh


arr = [1, 2, 3, 4, 5]
counter = 0

new_arr = []

loop do
  num = arr[counter]
  if num >= 3
    new_arr << 0
  else
    new_arr << num * 2
  end

  counter += 1
  break if counter == arr.size
end

p new_arr


def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter][0, 3]

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

p stars_2



pets = ['cat', 'parrot', 'dog', 'fish']
p pets.object_id
d = pets.map do |pet|
  pet.size == 3
end
p d.object_id
p d
p pets.object_id
p pets



mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  lead[:name] = names.map { |name| name.capitalize }.join(' ')
end

usable_leads = mailing_campaign_leads.reject do |lead|
  last_login = lead[:days_since_login]
  subscribed_to_list = lead[:mailing_list]
  last_login > 59 && !subscribed_to_list
end

p usable_leads
