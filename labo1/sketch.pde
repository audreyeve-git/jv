Player player;
Enemy enemy;

void setup(){
  size(800, 600);
  player = new Player();
  enemy = new Enemy();
  enemy.setDistance(400);
}

void draw(){
  background(200, 100, 150);
  player.update();
  player.display();
  enemy.display();
  enemy.update(player);
}
