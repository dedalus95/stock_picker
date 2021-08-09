def stock_picker(arr)
  if arr.index(arr.max) > arr.index(arr.min)
    new_array = [] << arr.index(arr.min)
    new_array << arr.index(arr.max)
    p new_array
  
  end
end

array = [2,5,8,9]
array1 = [9,5,8,2]
stock_picker(array)