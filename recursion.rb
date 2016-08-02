require 'byebug'
def range_recursion(start, last)
  return [] if start > last
  array = range_recursion(start + 1, last)
  array.unshift(start)
end


def range_iterative(start, last)
  result = []
  while start + 1 < last
    start += 1
    result << start
  end
  result
end

def rec_sum(arr)
  if arr.length <= 2
    arr[0] + arr[1]
  else
    arr.last + rec_sum(arr[0...-1])
  end
end

def it_sum(arr)
  sum = 0
  i = 0
  while i < arr.length
    sum += arr[i]
    i += 1
  end
  sum
end

def rec_exp_1(base, power)
  return 1 if power == 0
  base * rec_exp_1(base, power - 1)
end

def rec_exp_2(base, power)
  return 1 if power == 0
  if power.even?
    (rec_exp_2(base, (power / 2))) * (rec_exp_2(base, (power / 2)))
  else #if odd
    base * (rec_exp_2(base, ((power - 1) / 2))) * (rec_exp_2(base, ((power - 1) / 2)))
  end
end

class Array
  def deep_dup
    unless self.any? {|el| el.is_a?(Array)}
      return self.dup
    else
      self.map do |el|
        if el.is_a?(Array)
          el.deep_dup
        else
          el
        end
      end
    end
  end
end

def subsets(array)
  return [[]] if array.length == 0
  answer = subsets(array[0...-1])
  answer + answer.map { |el| el + [array.last]}
end


def fibonacci(n)
  return [1] if n == 0
  return [1,1] if n == 1
  array = fibonacci(n - 1)
  array.push(array[-2] + array[-1])
end

def b_search(arr, target)
  return nil if arr.length == 0
  pivot = arr.length/2
  space_value = arr[pivot] <=> target
  case space_value
  when 1
    b_search(arr[0...pivot], target)
  when 0
    return pivot
  when -1
    b_search(arr[pivot+1..-1], target)
  end
end

def merge(left, right)
  return left if right.length == 0
  return right if left.length == 0
  if left[0] >= right[0]
    merge(left, right[1..-1]).unshift(right.shift)
  else
    merge(left[1..-1], right).unshift(left.shift)
  end
end

def merge_sort(array)
  return array if array.length <= 1
  pivot = array.length / 2
  left_side = array[0...pivot]
  right_side = array[pivot..-1]
  merge(merge_sort(left_side), merge_sort(right_side))
end

def arr_of_coins(moneys, coins = [25, 10, 5, 3])
  # return coin if moneys % coin == 0
  result = []
  coins.each do |current_coin|
       if moneys / current_coin >= 1
          (moneys / current_coin).times {result << current_coin}
          (moneys / current_coin).times {moneys -= current_coin}
      end
    end
    result
end
