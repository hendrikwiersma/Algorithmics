int nrValues = 100000000;
bool exportSorted = false;

void sort(int[] a) {

      int [] bucket=new int[nrValues+1];

      for (int i=0; i<bucket.length; i++) {
         bucket[i]=0;
      }

      for (int i=0; i<a.length; i++) {
         bucket[a[i]]++;
      }

      int outPos=0;
      for (int i=0; i<bucket.length; i++) {
         for (int j=0; j<bucket[i]; j++) {
            a[outPos++]=i;
         }
      }
   }
public int [] generateData(int amount){
	int[] data = new int[amount];
	for(int i=0; i <= amount; i++ ){
		data[i] = Random.int_range (0, amount);
	}
	return data;
}

public void main () {
	int [] amounts = {4105, 6409, 10893, 34530, 35246, 41779, 45747, 48530, 49310, 55247, 63187, 69227, 77733, 82599, 85489, 87379, 87631, 87861, 95783, 96080};

	for (int i = 0; i < amounts.length; i++){

		//First get some randomly generated integers
		int [] data= generateData(amounts[i]);
		//Request the current time to calculate the execution time later
	    int64 msec = GLib.get_real_time ();
	    
		sort(data);
		float sortingTime = (GLib.get_real_time () - msec);
		print("It took " + (sortingTime).to_string() + " seconds to sort " + (amounts[i]).to_string() + " values with BucketSort. \n");
		//Exporting takes a VERY long time so it's off by default
		if(exportSorted){
			//Het every sorted value in one string to be able to export it later
			string output = "";
			for(int j = 0; j < data.length;j++){
				output = output + ", " + data[j].to_string();
			}
			try {
				string filename = "sorted.txt";
				//Finally output the whole string to the text file
				FileUtils.set_contents (filename, output);

			} catch (FileError e) {
				//Catch any file errors and print then to the user
				stderr.printf ("%s\n", e.message);
			}
			print("Done writing to file. \n");
		}
	}
	
}
