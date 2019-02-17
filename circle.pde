class circle{
  float x;
  float y;
  float r;
  boolean growing=true;
  
  circle(float x_,float y_){
   x=x_;
   y=y_;
   r=1;
  }
  void grow(){
    if(growing){
      r=r+0.5;
    } 
  }
  
 Boolean edges(){
   return (x+r>width || x-r<0 || y+r>height || y-r<0);
 }
  void show(){
    float red=random(0,255);
    float green=random(0,255);
    float blue=random(0,255);
    // stroke(255);
     stroke(0,0,255);
    //strokeWeight(1);
   //noFill();
    fill(0,0,255);
   ellipse(x,y,r*4,r*4);
   stroke(255,0,0);
   ellipse(x,y,r/20,r*20);
   
  }
  
}