class Firework {
  float x, y, vx, vy, fuel, fuse;
  boolean detonated;
  public Firework(float x, float y) {
    this.x = x;
    this.y = y;
    this.vx = 0;
    this.vy = 0;
    this.fuel = 50;
    this.fuse = 270 + (float) Math.random() * 200;
    this.detonated = false;
  }
  
  public void update() {
    // Lift
    if (this.fuel > 0) {
      this.vy -= 0.08;
      this.vx += (Math.random() - 0.5) * 0.18;
      this.fuel -= 1;
    }
    
    this.fuse -= 1;
    if (this.fuse <= 0) {
      this.detonate();
    }
    
    // Physics
    this.y += vy;
    this.x += vx;
    this.vy += .01;  // gravity
    
    // Draw if hasn't exploded
    if (!this.detonated) {
      fill(100);
      float brightness = (float) Math.random() * fuel / 8 + 2.0;
      ellipse(this.x, this.y, brightness, brightness);
    }
  }
  
  private void detonate() {
    this.detonated = true;
  }
}