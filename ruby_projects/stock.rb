#acskii :p


def stock_picker(prices)
  left, right = 0, 1
  max_profit = 0
  days = [left, right]

  while right < (prices.length - 1)
    if max_profit < (prices[right] - prices[left])
      max_profit = prices[right] - prices[left]
      days = [left, right]
    else
      left = right
    end
    right += 1
  end
  days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
#=> [1,4]