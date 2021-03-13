Flock flock;

PVector targetPillar = new PVector(320, 180);
float targetradius = 70;
int NumeroPersonas = 10;
int personasActual = 1;
int timestart = millis();

//Constantes

float A = 25.0;
float B = 0.08;
float k = 750;
float k2 = 3000;
float v0 = 5;
float ti = 0.5;

void setup() {
  size(700, 500);  
  //Personas
  flock = new Flock();
  flock.addBoid(new Boid(40,random(100, 400))); // Comienza con 1 persona
}

void draw() {
  background(50);
  line(0, 0, 600, 226); //pared 1
  line(0, 500, 600, 274); // pared 2
  line(40, 100, 40, 400); //spawn
  
  // Se agrega cada 1 segundo
  if (millis() > timestart + 1000 && personasActual < NumeroPersonas){
    flock.addBoid(new Boid(40,random(100, 400)));
    timestart = millis();
    personasActual++;
  }

  flock.run();
}

// Agregar personas con el mouse
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}



// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}




// The Boid class

class Boid {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  Boid(float x, float y) {
    
    acceleration = new PVector(0, 0);
    position = new PVector(x, y);

    // Leaving the code temporarily this way so that this example runs in JS
    float xangle = 0;
    float yangle = 0;
    
    //Centro del pasillo
    if(y > 226 && y < 274){
      yangle = 0;
      xangle = 1;
    }
    //Superior del pasillo
    if(y < 226){
      xangle = 1;
      yangle = atan((274-y)/(600-x));
    }
    //Inferior del pasillo
    if(y > 274){
      xangle = 1;      
      yangle = atan((274-y)/(600-x));
    }
    velocity = new PVector(xangle, yangle);
    velocity.mult(10); // velocidad inicial
    
    r = 10.0;
    maxspeed = 2;
    maxforce = 0.03;
  }

  void run(ArrayList<Boid> boids) {    
    flock(boids);
    update();
    render();
  }
   
  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector rep = repulsion(boids);   // Separation
    PVector cor = corporal(boids);      // Alignment
    PVector fricc = friccion(boids);   // Cohesion
    PVector murallaSup = murallaSup();   // muralla
    PVector murallaInf = murallaInf();   // muralla
    PVector vel = velocidad();   // muralla
    
    // Add the force vectors to acceleration
    applyForce(rep);
    applyForce(cor);
    applyForce(fricc);
    applyForce(murallaSup);
    applyForce(murallaInf);
    applyForce(vel);
    //applyForce(coh);
    //applyForce(pil);
  }

 // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector velocidad() {
    PVector steer = new PVector(0, 0, 0);    
    
    // Leaving the code temporarily this way so that this example runs in JS
    float xangle = 0;
    float yangle = 0;
    
    //Centro del pasillo
    if(position.y > 226 && position.y < 274){
      yangle = 0;
      xangle = 1;
    }
    //Superior del pasillo
    if(position.y < 226){
      xangle = 1;
      yangle = atan((274-position.y)/(600-position.x));
    }
    //Inferior del pasillo
    if(position.y > 274){
      xangle = 1;      
      yangle = atan((274-position.y)/(600-position.x));
    }
    
    PVector direccion = new PVector(xangle, yangle);
    
    direccion.mult(v0);
    direccion.sub(velocity);
    direccion.div(ti);
    
    steer.add(direccion);
    return steer;
  }

  void render() {
    
    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);
    
    //Dibujar circulos
    int sides = 50;
    float angle = 360 / sides;
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y);    
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  PVector murallaSup() {
    PVector steer = new PVector(0, 0, 0);    
    
    //Vectores para cada una de las fuerzas
    PVector murallaRep = new PVector(-600, 226);
    PVector murallaCorp = new PVector(-600, 226);
    PVector murallaFricc = new PVector(600, 226);
    murallaCorp.normalize();
    murallaRep.normalize();
    murallaFricc.normalize();
   
    //Ecuacion distancia entre punto a segmento
    float d = abs((600-0)*(0-position.y)-(0-position.x)*(226-0))/sqrt(pow(600,2)+pow(226,2));
    
      //float d = PVector.dist(position, targetPillar);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < r) && (position.x < 600)) {           
        float velocidad_rel = velocity.dot(murallaFricc);
        
        murallaCorp.mult(2*k*(r-d));
        murallaRep.mult(A*exp((r-d)/B));
        murallaFricc.mult(k2*(r-d)*velocidad_rel);
        
        steer.add(murallaCorp);
        steer.add(murallaRep);
        steer.add(murallaFricc);
      }
   
    return steer;
  }
  
  
  PVector murallaInf() {
    PVector steer = new PVector(0, 0, 0);    
    
    
    //Vectores para cada una de las fuerzas
    PVector murallaRep = new PVector(-(600-0), 274-500);
    PVector murallaCorp = new PVector(-(600-0), 274-500);
    PVector murallaFricc = new PVector(600-0, 274-500);
    murallaCorp.normalize();
    murallaRep.normalize();
    murallaFricc.normalize();
   
    //Ecuacion distancia entre punto a segmento
    float d = abs((600-0)*(500-position.y)-(0-position.x)*(274-500))/sqrt(pow(600,2)+pow(274-500,2));
    
      //float d = PVector.dist(position, targetPillar);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < r) && (position.x < 600)) {           
        float velocidad_rel = velocity.dot(murallaFricc);
        
        murallaCorp.mult(2*k*(r-d));
        murallaRep.mult(A*exp((r-d)/B));
        murallaFricc.mult(k2*(r-d)*velocidad_rel);
        
        steer.add(murallaCorp);
        steer.add(murallaRep);
        steer.add(murallaFricc);
      }
   
    return steer;
  }
 
    // Repulsion
  // Method checks for nearby boids and steers away
  PVector repulsion(ArrayList<Boid> boids) {
    float desiredseparation = 6*r;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);        
        diff.normalize();        
        diff.mult(A*exp((r*2-d)/B));
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    //if (steer.mag() > 0) {
    //  // First two lines of code below could be condensed with new PVector setMag() method
    //  // Not using this method until Processing.js catches up
    //  // steer.setMag(maxspeed);

    //  // Implement Reynolds: Steering = Desired - Velocity
    //  steer.normalize();
    //  steer.mult(maxspeed);
    //  steer.sub(velocity);
    //  steer.limit(maxforce);
    //}
    return steer;
  }
  
  // Coporal
  // Method checks for nearby boids and steers away
  PVector corporal(ArrayList<Boid> boids) {
    PVector steer = new PVector(0, 0, 0);
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d <= r*2)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);        
        diff.normalize();        
        diff.mult(2*k*(r*2-d));
        steer.add(diff);
      }
    }
    return steer;
  }
  
  // Friccion
  // Method checks for nearby boids and steers away
  PVector friccion(ArrayList<Boid> boids) {
    PVector steer = new PVector(0, 0, 0);
    
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d <= r*2)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        float velocidad_rel = velocity.sub(other.velocity).dot(diff);
        diff.normalize().rotate(HALF_PI);        
        diff.mult(k2*(r*2-d)*velocidad_rel);
        steer.add(diff);
      }
    }
    return steer;
  }
 
}
