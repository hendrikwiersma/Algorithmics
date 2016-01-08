maxValue = 1000000
nrValues = 10000000

BucketSort = {}

--Needed to get truly random integers
math.randomseed(os.time())

function BucketSort:sort( data )
   bucket = {}      
      --First set all the values to zero.
      for i=0, #data do
         bucket[i] = 0
      end
      --Then when a value is found increment the correct value on the index index
      for i=0, #data do
         bucket[data[i]] = bucket[data[i]] + 1
      end
      --Now read the new array in order to get all the values from low to high
      outPos = 0
      for i=0, #bucket do
         for j=1, bucket[i] do
            data[outPos] = i
            outPos = outPos+1
         end
      end
   --And return it
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
   --Open up a file in the write mode
   file = io.open("sorted.txt", "w")
   --set the output to that file
   io.output(file)
   -- Write every array value 
   result = BucketSort:sort(generateData())
   for i=0, #result do
      io.write(",", result[i])
   end
   io.close(file)
   print("The bucketsort took " .. os.clock() - nClock .. " seconds to sort the values.")