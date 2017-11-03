//creates explosions for the fireworks
ParticleSystem ps;
float x;
float y;
int num_particles = 0;
void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(width/2, 50));
  
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
  if (num_particles % 100 == 0){
  x = random(150, 490);
  y = random(80, 280);
  ps = new ParticleSystem(new PVector(x, y));
  }
  num_particles++;
}

 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  boolean done;
  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.gone()) {
        particles.remove(i);
      }
    }
  }
}




class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float particle_life = 255;
  float size = particle_life/60;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.035);
    velocity = new PVector(random(-2, 2), random(-2, 1));
    position = l.copy();
    particle_life = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    particle_life -= 1.0;
    size -= 0.05;
    stroke(particle_life, particle_life, 0);
    fill(particle_life, particle_life, 0);
  }


  void display() {
    stroke(particle_life, 0);
    fill(particle_life, particle_life, 0);
    ellipse(position.x, position.y, size, size);
  }


  boolean gone() {
    if (particle_life < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
