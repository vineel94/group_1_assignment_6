class particleExplosion {
  ArrayList<Particle> particles;
  PVector origin;
  boolean done;
  particleExplosion(PVector position) {
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
      if (p.done()) {
        particles.remove(i);
      }
    }
  }
  void explode() {
    pe.addParticle();
    pe.run();
  }
  }



class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float particle_life = 255;
  float size = particle_life/60;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-2, 2), random(-2, 1));
    position = l.copy();
    particle_life = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
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


  boolean done() {
    if (particle_life < 0.0) {
      return true;
    } else {
      return false;
    }
  }

}
