# This method selects the right days to buy and sell
# by subtracting all values
# from right to left. An array of the indexes of the values 
# that return the max result from the subtraction are printed to the console.
# Subtractions are carried on by looping through the array
# until the indexes of the array values are less than or equal to zero
#------------------------------------------------


#GUIDE TO CODE

# arr is the parameter
#------------------------------------------------
# left_operand_index is the index of the subtracted value in the array (remember that it is a right to left subtraction)
#------------------------------------------------

# right_operand_index is the index of the 'subtracter'
#------------------------------------------------

# array_of_result is an array in which every result of the iteration is passed
#------------------------------------------------

# array_of_arrays_of_results is an array of all the ORGANIZED 
# results. The each_slice method allowed me to isolate the results of each subtraction.
# array_of_arrays_of_results[nested array][0] == right_operand_index
# array_of_arrays_of_results[nested array][1] == left_operand_index 
# array_of_arrays_of_results[nested array][2] == result of the subtraction
# To put it simple, every nested array now contains the values which are
# going to be selected for being passed to the final array.
#------------------------------------------------

# array_without_useless_arrays is an array from which useless arrays, i.e.
# arrays which have a bigger left_operand_index than right_operand_index, 
# are removed: we only need RIGHT TO LEFT SUBTRACTIONS! 
#------------------------------------------------

#c, d, e
# I think that the last part is pretty straightforward: I create an
# array of arrays containing only the results of every subtraction.
# Since we need the max result, because we are required to return
# the best trade off between buying day and selling day, I flattened
# the array and got back the max value from it. Than I compared that 
# value with all the result values of the array_without_useless_array.
# Finally, I popped it and returned the requested remaining values.



def stock_picker(arr)
left_operand_index = arr.length - 1
right_operand_index = arr.length - 1
array_of_results = []


until left_operand_index <= 0 && right_operand_index <= 0
  
  result = arr[right_operand_index] - arr[left_operand_index]


  left_operand_index -= 1 


   @live_array = array_of_results << right_operand_index
   @live_array = array_of_results << left_operand_index + 1
   @live_array = array_of_results << result

  
   if left_operand_index < 0 && left_operand_index < right_operand_index
    right_operand_index -= 1
    left_operand_index = arr.length - 1 
   end

  #  p array_of_results
end

array_of_arrays_of_results = array_of_results.each_slice(3).to_a

b = array_of_arrays_of_results.select do
  |a| a[1] > a[0]

end

array_without_useless_arrays = array_of_arrays_of_results -  b

c = array_without_useless_arrays.map do
  |a| b = []
  b << a[2]

end


c.flatten!
d = c.max
e = array_without_useless_arrays.find do
  |n| n[2] == d
  end

e.flatten!
e.pop
e.reverse!
print e

end

array = [44,33,32,55,4,4,44,5,3,2,9,77,77,55,3,33,44,5,5]
stock_picker(array)


