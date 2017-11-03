ArrayList<Firework> fireworkList = new ArrayList<Firework>();
ArrayList<Smoke> smokeList = new ArrayList<Smoke>();
int frame;

public void setup() {
  size(1000, 780);
}

public void draw() {
  if (frame % 10 == 0) {
    float xOffset = (float) (Math.random() - 0.5) * 300;
    fireworkList.add(new Firework(500 + xOffset, 780));
    smokeList.add(new Smoke(fireworkList.get(fireworkList.size()-1)));
  }
  
  colorMode(RGB, 100);
  background(5, 10, 20);
  int count = 0;
  for (Firework firework : fireworkList) {
    firework.update();
    smokeList.get(count).update();
    count ++;
  }
  
  frame++;
}
