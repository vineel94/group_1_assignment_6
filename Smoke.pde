class Smoke{
  Firework parent;
  public Smoke(Firework parent){
    this.parent = parent;
  }
  float vx = 5;
  float x = 0;
  float y = 0;
  float vy = .1;

  public void update(){
    if(parent.detonated == false){
      //thrust
      x = parent.x;
      y = parent.y;
      stroke(230,15,40);
      line(x,y,x+vx,y- 5* parent.vy);
      stroke(255);
    }
    else{
      //wind
      x = x + vx/5;
      //thermal updraft
      y = y - vy;
      fill(30, 40, 55);
      ellipse(x,y,14,4);
      fill(255);
    }
  }
}
