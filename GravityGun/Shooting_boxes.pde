// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Basic example of falling rectangles

PImage gun;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

void setup() {
  size(1000,500);
  smooth();
  gun = loadImage("Gun.png");

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -100);

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(height,5,10,100));
  boundaries.add(new Boundary(50,250,10,100));
  boundaries.add(new Boundary(250,350,10,100));
  boundaries.add(new Boundary(50,250,10,100));
  boundaries.add(new Boundary(1000,0,10,900));
  boundaries.add(new Boundary(350,500,10,100));
  boundaries.add(new Boundary(50,250,10,100));
  boundaries.add(new Boundary(750,480,10,100));
  boundaries.add(new Boundary(800,0,10,500));
  boundaries.add(new Boundary(300,0,10,400));
  boundaries.add(new Boundary(650,500,10,100));
  boundaries.add(new Boundary(700,250,10,100));
  boundaries.add(new Boundary(500,0,800,10));
  boundaries.add(new Boundary(0,500,800,10));
}

void draw() {
  background(#8DE5A2);
  image(gun, mouseX-100,mouseY-28);
  text("Hold left clic to shoot, press w, a, s and d to change direction", 10,50);
  text("Get the bullets to the bottom", 10, 70);
  fill(#8EEADF);
  textSize(15);

  // We must always step through time!
  box2d.step();

  // Boxes fall from the top every so often
  if (mousePressed == true) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
    box2d.setGravity(50,0);
  }

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
void keyPressed(){
  if(key == 'w'){
    box2d.setGravity(0, 50);
  }
  if(key == 's'){
    box2d.setGravity(0, -50);
  }
  if(key == 'd'){
    box2d.setGravity(50, 0);
  }
  if(key == 'a'){
    box2d.setGravity(-50, 0);
  }

    
    
  }