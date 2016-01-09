int maxValue = 100000; //It takes about a minute to sort with these settings
int nrValues = 100000;
bool exportSorted = false;

public int [] sort(int [] data){
  int tmp = 0;
  //Go through all the integers
  for(int i=1; i<data.length; i++){

    //And compare to the previous ones
    for(int j=i; j>0; j--){
      //if the integer is smaller it shifts the previous value up one index
      if(data[j] < data[j-1]){
	tmp = data[j];
	data[j] = data[j-1];
	data[j-1] = tmp;
      }
    }
  }
  return data;
}

public int [] generateData(){
	int[] data = new int[nrValues];
	for(int i=0; i <= nrValues; i++ ){
		data[i] = Random.int_range (0, maxValue);
		//print("value" + (data[i]).to_string() + "\n");
	}
	return data;
}

public void main () {
	//First get some randomly generated integers
	int [] data= generateData();
	//Request the current time to calculate the execution time later
	GLib.DateTime now = new GLib.DateTime.now_local();
    	uint64 currentSeconds = now.to_unix();

	sort(data);
	//Exporting takes a VERY long time so it's off by default
	if(exportSorted){
		//Put every sorted value in one string to be able to export it later
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
	print("It took " + (newNow.to_unix() - currentSeconds).to_string() + " seconds to sort with InsertSort. \n");
}
