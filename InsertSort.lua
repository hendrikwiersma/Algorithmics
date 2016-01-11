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

function generateData(amount)
   data = {}
   --generate a new array with random integer values
   for i=0, amount do
      data[i] = math.random(amount)
   end
   return data
end

  amounts = {[0]=4105, 6409, 10893, 34530, 35246, 41779, 45747, 48530, 49310, 55247, 63187, 69227, 77733, 82599, 85489, 87379, 87631, 87861, 95783, 96080}

  for i=0, #amounts do
    data = generateData(amounts[i])
    --Get the current time to calculate the execution time later on
    nClock = os.clock()
    -- Write every array value
    result = InsertSort:sort(data)

     print("The InsertSort took " .. os.clock() - nClock .. " seconds to sort ".. amounts[i] .. " values.")
     if (exportSorted) then
       --Open up a file in the write mode
       file = io.open("sorted.txt", "w")
       --set the output to that file
       io.output(file)
       for i=1, #result do
          io.write(",", result[i])
       end
       io.close(file)
       print("Done writing to file.")
     end
  end
   
