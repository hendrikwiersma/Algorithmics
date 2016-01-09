maxValue = 100000
nrValues = 100000
exportSorted = false

InsertSort = {}

--Needed to get truly random integers
math.randomseed(os.time())

function InsertSort:sort ( data )

  tmp = 0
  --Go through all the integers
  for i=1, #data do
    --And compare to the previous ones
    for j=i, 1, -1 do
      --if the integer is smaller it shifts the previous value up one index
      if (data[j] < data[j-1]) then
	tmp = data[j]
	data[j] = data[j-1]
	data[j-1] = tmp
      end
    end
  end
  return data
end

function generateData()
   data = {}
   --generate a new array with random integer values
   for i=0, nrValues do
      data[i] = math.random(maxValue)
   end
   return data
end

   --Get the current time to calculate the execution time later on
   nClock = os.clock()

   -- Write every array value
   result = InsertSort:sort(generateData())
   if (exportSorted) then
     --Open up a file in the write mode
     file = io.open("sorted.txt", "w")
     --set the output to that file
     io.output(file)
     for i=1, #result do
        io.write(",", result[i])
     end
     io.close(file)
   end

   print("The bucketsort took " .. os.clock() - nClock .. " seconds to sort the values.")
