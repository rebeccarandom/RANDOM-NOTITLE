//Artwork is located in a separeted Artwork-Folder

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


class Shape{
  
   float x, y;
   PVector speed;
   PImage []img = new PImage[8];
   int p;
   
  Shape(int p) { 
    
    this.p = p;
    x = random(-80,80);
    y = random(-80,80);  
   
    for (int i = 0; i < img.length; i ++ ) {
      img[i] = loadImage( "shape" + i + ".png");
    }       
   
    speed = new PVector(random(-2, 2), random(-1, 1));  
    image(img[p],0,0);  
  } 
 
  void drawShape(){
     
     moveShape();                                 
     pushMatrix();                      
     translate(x + img[p].width, y + img[p].height);
     //rotate(speed.heading()); //+ PI/2);                    
     translate(-img[p].width/3, -img[p].height/3);            
     image(img[p], 0, 0);                                        
     popMatrix(); 
     
  }

  void moveShape(){
    
    float testMove = random(0, 1);          
  
    if (testMove < 0.2)                 
      speed.rotate(random(-0.2, 0.2));    
    
    if (testMove > 0.9)
       speed.rotate(random(-0.4, 0.4));    
  
    x = x + speed.x;
    y = y + speed.y;

    if(isShapeOffScreen() == true){
      x = x + speed.x; 
      y = y + speed.y;
      speed.rotate(random(-0.3, 0.3));
    }
  }

  boolean isShapeOffScreen(){                    
                    
    if (x < -50 || x > width + 50 || 
        y < -50 || y > height + 50) 
        return true;
        return false;
  }
  
}
