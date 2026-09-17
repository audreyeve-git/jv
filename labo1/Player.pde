class Player{
  PVector position;
  float speed;
  color c;
  
  Player() {
    position = new PVector(1, 500);
    speed = 3;
    c = color(0, 255, 250);
  }
  
  void display() {
    fill(c);
    rect(position.x, position.y, 40, 40);
}

  void update(){
    c = color(random(255), random(255), random(255));
    if(keyPressed) {
      if (key == 'a' || key == 'A') {
        if (position.x > 1) {
          position.x -= speed;
        }
      }
      if (key == 'd' || key == 'D') {
        if (position.x < 760){
          position.x += speed;
        }
      }
    }
  }
}
