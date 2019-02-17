PImage image;
ArrayList <PVector> spots;
ArrayList <circle> circles;
void setup(){
  size(486,619);
  spots=new ArrayList<PVector>();
  image=loadImage("1.png");
  image.loadPixels();
  for(int x=0;x<width;x++){
   for(int y=0;y<height;y++){
    int index=int(x+y*width);
    color c= image.pixels[index];
    float b=brightness(c);
    if(b>1){
     spots.add(new PVector(x,y)); 
    }
   }
  }
  circles=new ArrayList<circle>();
  
}

void draw(){
  background(0);
  frameRate(20);
  int total=50;
  int count=0;
  int attempts=0;
  while(count<total){
    circle Cnew=newCircle();
    if(Cnew!=null){
          circles.add (Cnew); 
    }
    count++;
    attempts++;
    if(attempts>1000){
      noLoop();
      println("finished");
       break; 
    }
  }
 
  for(circle c:circles){
    if(c.growing){
      if(c.edges()){
        c.growing=false;
      }else{
       for(circle other:circles){
         if(c!=other){
           float d=dist(c.x,c.y, other.x,other.y);
           if(d-2<c.r+other.r){
            c.growing=false;
            break;
           }
         }
       }  
    }
  }
  c.show();
  c.grow();
  }
}

circle newCircle(){
  int r=int(random(0,spots.size()));
  PVector spot=spots.get(r);
  float x=spot.x;
  float y=spot.y;
  boolean flag=true;
  
  for(circle c:circles){
    float d= dist(x,y,c.x,c.y);
    if(d<c.r+2){
     flag=false;
     break;
    }
  }
  if(flag){
    return new circle(x,y);
  }else{
   return null; 
  }
}