# acskii :p

def bubble_sort(list)
  n = list.length
  #pass = 0

  while true
    sorted = false
    for index in (1...n)
      if list[index] < list[index-1]
        sorted = true
        t = list[index]
        list[index] = list[index-1]
        list[index-1] = t
      end
    end
    break if !sorted 
    #pass += 1
  end
  #puts pass  #=> 4
  list
end

p bubble_sort([4,3,78,2,0,2])
#=> [0, 2, 2, 3, 4, 78]