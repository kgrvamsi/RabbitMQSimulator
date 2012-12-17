class Transfer {
  Stage stage;
  
  float x, y;
  int radii = 5;
  float distX, distY;
  float step = 0.02;
  float pct = 0.0;
  boolean finished = false;
  String data;
  Node from, to;
  
  Transfer(Stage stage, Node from, Node to, String data) {
    this.stage = stage;
    this.from = from;
    this.to = to;
    this.data = data;
    
    x = from.x;
    y = from.y;
    this.updateDist();    
  }
  
  String getData() {
    return data;
  }
  
  boolean isFinished() {
    return finished;
  }
  
  void updateDist() {
    distX = to.x - from.x;
    distY = to.y - from.y;
  }
  
  void update() {
    updateDist();
    if (pct < 1.0) {
      this.x = from.x + (pct * distX);
      this.y = from.y + (pct * distY);
    }
  }
  
  void draw() {
    pct += step;
    fill(255);
    ellipse(x, y, radii*2, radii*2);
  }
  
  void afterDraw() {
    if (pct >= 1.0) {
      finished = true;
      from.transferDelivered(this);
      to.trasnferArrived(this);
    }
  }
}
