class RainDrop {
  //class variables
  float x = random(width);
  float y = random(height);
  int green = int(random(130, 191));
  int blue = int(random(210, 255));
  
  public float diameter = 0;
  public float opacity = random (0, 255);
  
  //draw raindrop
  void display(){
    noStroke();
    fill(0, green, blue, opacity);
    //create variable that will change the size of the starting rain
    ellipse(x, y, diameter, diameter);
    for(int i = 0; i < 10; i++){
      diameter+=0.15;
      opacity-= 0.5;
    }
  }
  
  void reset() {
    x = random(width);
    y = random(height);
    opacity = 255;
    diameter = 0;
  }
}
