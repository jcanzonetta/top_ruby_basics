def stock_picker(price_history)
  transaction = Hash.new(0)

  price_history.each_with_index do |current_price, current_day|
    remaining_array = price_history.slice(current_day, price_history.length)
    sell_price = remaining_array.max
    profit = sell_price - current_price

    next unless profit > transaction[:best_profit]

    transaction = {
      buy_price: current_price,
      buy_day: current_day,
      sell_price: sell_price,
      sell_day: remaining_array.index(sell_price) + current_day,
      best_profit: sell_price - current_price
    }
  end
  p "Buy the stock on day #{transaction[:buy_day]} for $#{transaction[:buy_price]},"
  p "and sell the stock on day #{transaction[:sell_day]} for $#{transaction[:sell_price]},"
  p "for the highest profit of $#{transaction[:best_profit]}."
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
