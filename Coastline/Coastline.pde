ArrayList<ArrayList<CoastSegment>> coasts = new ArrayList<ArrayList<CoastSegment>>();
ArrayList<CoastSegment> coast = new ArrayList<CoastSegment>();
boolean done = false;
boolean finalEnd = false;
PVector pI;
PVector pN;
void setup() {
  fullScreen();
  ellipseMode(RADIUS);
  background(220, 240, 250);
  stroke(0);
  fill(249, 246, 216);
}

void draw() {
  if (!finalEnd) {
    background(220, 240, 250);
    for (ArrayList<CoastSegment> coast : coasts) {
      for (CoastSegment seg : coast) {
        seg.drawSeg();
      }
    }
    for (CoastSegment seg : coast) {
      seg.drawSeg();
    }
  }
  if (!done && !finalEnd) {
    if (pI!=null) {
      ellipse(pI.x, pI.y, 10, 10);
      line(pN.x, pN.y, mouseX, mouseY);
    }
  }
}

void mousePressed() {
  if (true) {
    PVector mouse = new PVector(mouseX, mouseY);
    if (pI==null) {
      done=false;
      coast= new ArrayList<CoastSegment>();
      pI = mouse;
      pN = pI.copy();
    } else {
      if (PVector.dist(pI, mouse)<10) {
        done = true;
        mouse=pI.copy();
        pI=null;
      }
      coast.add(new CoastSegment(pN, mouse));
      pN=mouse;
      if (done) {
        coasts.add(coast);
      }
    }
  }
}


void keyPressed() {
  if (keyCode==ENTER && done && !finalEnd) {
    println("Fractaling");
    background(220, 240, 250);
    for (ArrayList<CoastSegment> coast : coasts) {
      for (int i = 0; i<12; i++) {
        ArrayList<CoastSegment> newCoast = new ArrayList<CoastSegment>();
        for (CoastSegment seg : coast) {
          newCoast.addAll(seg.divide());
        }
        coast=newCoast;
      }
      finalEnd=true;
      beginShape();
      for (CoastSegment seg : coast) {
        vertex(seg.p1.x, seg.p1.y);
      }
      endShape(CLOSE);
    }
    save("maps/"+random(100000)+".png");
  }
}