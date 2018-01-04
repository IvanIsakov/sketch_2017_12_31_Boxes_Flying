Particle MyParticle = new Particle();
ArrayList<Particle> particles = new ArrayList<Particle>();
float speedMax = 2.0;
int NuPts = 100;
long index = 0;
float SizeMax = 8;
float cameraAngleX = 0;
float cameraAngleY = 0;

void setup() {
  //size(1536, 2048, P3D);
  size(1040, 768, P3D);
  //fullScreen();
  background(0);
  for (int i = 0; i < NuPts; i++) {
    Particle p = new Particle();
    particles.add(p);
    //p.initialize();
    p.MouseInitialize(0, -100);
  }
  //MyParticle.initialize();
}

void draw() {
  background(10);
  lights();
  if (mousePressed) {
    cameraAngleX = map(mouseX,0,width,-PI/2,PI/2);
    cameraAngleY = map(mouseY,0,height,-PI/2,PI/2);
  }
  camera(400*sin(cameraAngleX),400*sin(cameraAngleY),400*cos(cameraAngleX)*cos(cameraAngleY),
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  for (Particle p : particles) {
    p.update();
    p.display();
    if (index > 400) {
      p.MouseInitialize(0, -100);
    }
  }
  
  index++;
  if (index > 401) index = 0;
}

class Particle {
  float x;
  float y;
  float z;
  float speedX;
  float speedY;
  float speedZ;
  float gravityY = 0.02;
  color pColor;
  float SizeP;
  float rotateXa;
  float rotateYa;
  float AlphaC;
  
  void Particle() {
  }
  
  void update() {
    speedX = speedX;
    speedY += gravityY;
    x += speedX;
    y += speedY;
    z += speedZ;
    rotateXa += speedX/10;
    rotateYa += speedX/10;
    if (x > width || x < 0 || y > height || y < 0) {
     // initialize();
    }
  }
  
  void display() {
    noStroke();
    fill(pColor);
   // alpha();
   // ellipse(x,y,SizeP,SizeP);
    pushMatrix();
    translate(x,y,z);
    rotateX(rotateXa);
    rotateY(rotateYa);
    box(SizeP);
    popMatrix();
  }
  
  void initialize() {
    x = random(width);
    y = random(height);
    speedX = random(-10,10);
    speedY = -random(20);
    SizeP = SizeMax;
  }
  
  void MouseInitialize(int mx, int my) {
    x = mx;
    y = my;
    z = 0;
    speedX = random(-speedMax,speedMax);
    speedY = -random(2*speedMax);
    speedZ = random(-speedMax,speedMax);
    SizeP = SizeMax;
    pColor = color(random(100,255),random(100,255),255);
  }
}

void mousePressed() {
// cameraAngle = map(mouseX,0,width,-PI/2,PI/2);
  /*
  for (Particle p : particles) {
    p.MouseInitialize(mouseX/7 - 100, mouseY/5 -200);
    //p.MouseInitialize(0, -100);
  }
  */
}