def bubble_sort(inputArray)
  len = inputArray.length

  sorts = 0

  (0..(len - 2)).each do |i|
    next unless inputArray[i] > inputArray[i + 1]

    temp = inputArray[i + 1]
    inputArray[i + 1] = inputArray[i]
    inputArray[i] = temp
    sorts += 1
  end

  sorts == 0 ? (return inputArray) : (return bubble_sort(inputArray.slice(0, len - 1)) << inputArray[len - 1])
end

p bubble_sort([4, 3, 78, 2, 0, 2])
