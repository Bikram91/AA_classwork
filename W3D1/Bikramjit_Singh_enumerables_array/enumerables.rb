class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  return_value = [1, 2, 3].my_each do |num|
    puts num
  end.my_each do |num|
    puts num
  end
  # => 1
  2
  3
  1
  2
  3
  
  p return_value  # => [1, 2, 3]



  def my_select(&prc)
    newarr = []
    self.my_each do |ele|
      if prc.call(ele)
        newarr << ele
      end
    end
    p newarr
  end

  a = [1, 2, 3]
  a.my_select { |num| num > 1 } # => [2, 3]
  a.my_select { |num| num == 4 } # => []

  def my_reject(&prc)
    newarr = []
    self.my_each do |ele|
      if !prc.call(ele)
        newarr << ele
      end
    end
    p newarr
  end


  a = [1, 2, 3]
  a.my_reject { |num| num > 1 } # => [1]
  a.my_reject { |num| num == 4 } # => [1, 2, 3]

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  a = [1, 2, 3]
  p a.my_any? { |num| num > 1 } # => true
  p a.my_any? { |num| num == 4 } # => false
  p a.my_all? { |num| num > 1 } # => false
  p a.my_all? { |num| num < 4 } # => true

  def my_all?(&prc)
    self.my_each do |ele|
      return false if !prc.call(ele)
    end
    true
  end



  def my_flatten
    arr = []
    self.each do |ele|
      if ele.is_a?(Array)
        arr += ele.my_flatten
      else
        arr << ele
      end
    end
    arr
  end

  p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


  def my_zip(*args)
    # new_arr = Array.new(self.length){Array.new(args.length + 1)}

    # (0...args.length).my_each do |i|
    #     new_arr[i] = self[i]]
    # end
    new_arr = []
    self.each_with_index do |ele, i|
      arr = [ele]
      args.each do |arg|
        arr << arg[i]
      end
      new_arr << arr
    end
    new_arr
  end

  a = [4, 5, 6]
  b = [7, 8, 9]
  p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  p a.my_zip([1, 2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
  p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

  c = [10, 11, 12]
  d = [13, 14, 15]
  p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]



  def my_rotate(num = 1)
    newarr = self.dup

    if num > 0
      num.times do
        ele = newarr.shift
        newarr.push(ele)
      end
    else
      (num * -1).times do
        ele = newarr.pop
        newarr.unshift(ele)
      end
    end
    newarr
  end

  a = ["a", "b", "c", "d"]
  p a.my_rotate         #=> ["b", "c", "d", "a"]
  p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
  p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
  p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



  def my_join(str = "")
    new_str = ""
    self.each do |ele|
      new_str << ele
      new_str << str
    end
    return new_str if str == ""
    new_str[0..-2]
  end

  a = ["a", "b", "c", "d"]
  p a.my_join         # => "abcd"
  p a.my_join("$")    # => "a$b$c$d"



  def my_reverse
    newarr = []
    self.each do |var|
      newarr.unshift(var)
    end
    newarr
  end

  p ["a", "b", "c"].my_reverse   #=> ["c", "b", "a"]
  p [1].my_reverse               #=> [1]



  def bubble_sort!(&prc)
    sorted = false

    while !sorted
      sorted = true
      self.each_with_index do |ele, i|
        if prc.call(ele, self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end

  a = [1, 5, 4, 3, 2]
  p a.bubble_sort! { |a, b| a <=> b }

  def bubble_sort(&prc)
    new_arr = self.clone
    sorted = false

    while !sorted
      sorted = true
      new_arr.each_with_index do |ele, i|
        if prc.call(ele, new_arr[i + 1]) == 1
          new_arr[i], new_arr[i + 1] = new_arr[i + 1], new_arr[i]
          sorted = false
        end
      end
    end
    new_arr
  end
end



a = [1, 5, 4, 3, 2]
p a.bubble_sort { |a, b| a <=> b }

def factors(num)
  new_arr = []
  (1..num).each do |factor|
    new_arr << factor if num % factor == 0
  end
  new_arr
end

p factors(6) #=> [1,2,3,6]

def substrings(string)
  arr = []
  i = 0
  while i < string.length
    j = i
    while j < string.length
      arr << string[i..j]
      j += 1
    end
    i += 1
  end
  arr
end

p substrings("cat") #["c", "ca", "cat", "a", "at", "t"]`

def subwords(word, dictionary)
  new_arr = []
  arr = substrings(word)
  arr.each do |ele|
    new_arr << ele if dictionary.include?(ele)
  end
  new_arr
end

p subwords("cat", ["cat", "at", "a"]) #["cat", "at", "a"]






























