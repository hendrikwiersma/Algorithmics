int maxValue = 100000000; //A max value of one hundred million
int nrValues = 100000000; //One hundred million values
bool exportSorted = false;

void sort(int[] a, int maxVal) {

      int [] bucket=new int[maxVal+1];

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
public int [] generateData(){
	int[] data = new int[nrValues];
	for(int i=0; i <= nrValues; i++ ){
		data[i] = Random.int_range (0, maxValue);
	}
	return data;
}

public void main () {
	//First get some randomly generated integers
	int [] data= generateData();
	//Request the current time to calculate the execution time later
	GLib.DateTime now = new GLib.DateTime.now_local();
    	uint64 currentSeconds = now.to_unix();

	sort(data,maxValue);
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
	}
	//A new DateTime object needs to be created to calculate the difference in time.
	GLib.DateTime newNow = new GLib.DateTime.now_local();
	print("It took " + (newNow.to_unix() - currentSeconds).to_string() + " seconds to sort with BucketSort. \n");
}
