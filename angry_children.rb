class QuickSort

# Code required to read in the values of k,n and candies.
  def self.sort!(keys)
    quick(keys,0,keys.size-1)
  end
 
  private
 
  def self.quick(keys, left, right)
    if left < right
      pivot = partition(keys, left, right)
      quick(keys, left, pivot-1)
      quick(keys, pivot+1, right)
    end
    keys
  end
 
  def self.partition(keys, left, right)
    x = keys[right]
    i = left-1
    for j in left..right-1
      if keys[j] <= x
        i += 1
        keys[i], keys[j] = keys[j], keys[i]
      end
    end
    keys[i+1], keys[right] = keys[right], keys[i+1]
    i+1
  end
 
end

def min_unfairness(n, k, candy)
  sorted_candy = QuickSort.sort!(candy)
  if n < k 
    return (sorted_candy.max - sorted_candy.min)     
  end 
  last_element = n - (k + 1)    
  min_unfair = sorted_candy[k-1] - sorted_candy[0]  
  
  (1).upto(last_element).each_with_index do|elem, index| 
    next_element = sorted_candy[index + k - 1] 
    if (next_element - elem) < min_unfair
      min_unfair = next_element - elem
    end
  end
  min_unfair
end

n = gets.to_i
k = gets.to_i
candy = Array.new(n)
for i in 0..n-1
  candy[i] = gets.to_i
end
ans = min_unfairness(n, k, candy)### Compute answer from k, n, candies
puts ans

