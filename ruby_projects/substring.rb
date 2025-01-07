# acskii :p

def substrings(original, subs)
  subs.reduce(Hash.new) do |tally, sub|
    original_a = original.downcase
    p = 0
    
    while p < original.length - 1
      if sub[0] == original_a[p]
        j = 1

        while j <= sub.length-1
          p += 1
          
          if sub[j] != original_a[p]
            break
          end

          j += 1
        end
        
        if j == sub.length
          if tally.dig(sub)
            tally[sub] += 1
          else
            tally[sub] = 1
          end
        end
      end
      
      p += 1
    end
    
    tally
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)