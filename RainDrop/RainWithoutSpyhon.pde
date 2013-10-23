//declaring XML elements
XML dataFeed;
XML[] title;
XML[] date;
XML[] value;
String[] titles;

//declaring arrays
RainDrop[] rD = new RainDrop[500];

//declaring sensor variables
String rainSensor = "RainSensor"; float getRain;
String windDirection = "WindVane"; float getWindDirection;
String windSpeed = "WindSpeed"; float getWindSpeed;
String tempBlockA = "AirTempBlockA"; float getTempBlockA;
String tempBlockB = "AirTempBlockB"; float getTempBlockB;
String tempBlockC = "AirTempBlockC"; float getTempBlockC;
String outsideTemp = "OutsideAirTemp"; float getTemp;


void setup() {
  size(600,600);
  smooth();
  
  String url = "http://www.arch-os.com/livedata/";
  dataFeed = loadXML(url);
  
  title = dataFeed.getChildren("channel/item/title");
  date = dataFeed.getChildren("channel/item/pubDate");
  value = dataFeed.getChildren("channel/item/description");
  titles = new String[title.length];
  
  for(int i = 0; i < rD.length; i++){
    rD[i] = new RainDrop();
  }
}

void draw() {
  background(255, 100);
  getData();
  println(getRain);
  
  for(int i = 0; i < int(getRain/*replace with number i.e. 500 for heavy rain*/); i++) {
    //Check if object exists
    if(rD[i] != null) {
      //Display if it does exist
      rD[i].display();
      //Check the object's opacity and reset it if equal or below zero
      if(rD[i].opacity <= 0) rD[i].reset();
    }
  }
}
