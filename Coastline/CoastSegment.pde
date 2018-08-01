class CoastSegment {
  PVector p1;
  PVector p2;
  CoastSegment(PVector p1_, PVector p2_){
    p1=p1_;
    p2=p2_;
  }
  ArrayList<CoastSegment> divide(){
    PVector n1;
    PVector n2;
    if(random(1)>.5){
      n1 = p1;
      n2 = p2;
    } else {
      n1 = p2;
      n2 = p1;
    }
    PVector offset = PVector.sub(n2,n1);
    offset.mult(random(.1,.8));
    offset.rotate(randomGaussian() * .3);
    ArrayList<CoastSegment> newCoast = new ArrayList<CoastSegment>();
    PVector n3 = PVector.add(n1,offset);
    newCoast.add(new CoastSegment(p1,n3));
    newCoast.add(new CoastSegment(n3,p2));
    return newCoast;
    
  }
  void drawSeg(){
    line(p1.x,p1.y,p2.x,p2.y);
  }
  
  
}