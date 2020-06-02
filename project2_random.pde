
ArrayList <Shape> shapes = new ArrayList<Shape>();
int anzShapes = int(random(3,7));  
int p = int(random(0,8));

PImage [] bg = new PImage[8];

void setup(){
  fullScreen();
  frameRate(40); 

  for (int i = 0; i < bg.length; i ++ ) {
    bg[i] = loadImage( "bg" + i + "_r...png" );
  }
  
  for(int i = 0; i < anzShapes; i++) {      
    shapes.add(new Shape(p));            
  }
  //image(bg[1], 0, 0, width*1, height*1);
  image(bg[int(random(0,8))], 0, 0, width*1, height*1);
  
}

void draw () {
  
  for(int i = 0; i < anzShapes; i ++) 
    shapes.get(i).drawShape();               
 
}

void keyPressed() {
  if (keyPressed) {
    if(key == ' ') {
      looping =  !looping;
    } 
    
  } 
  
}
