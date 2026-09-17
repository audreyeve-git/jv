class Enemy{
  PVector position; //position enemy
  float speed; //vitesse déplacement enemy
  float distance; //dist entre enemy et player
  float distanceActivation; //dist à partir de laquelle l'enemy devient actif
                            //distance < distanceActivation = enemy activé
                            //distance >= distanceActivation = enemy repos
  boolean active; //état enemy (false = repos)
  PVector anchor; //point d'ancrage de l'élastique
  float elastic; //longueur maximale de l'élastique
  
  Enemy() {
    position = new PVector(400, 300);
    speed = 3;
    anchor = new PVector(400, 300);
    elastic = 175;
    distanceActivation = 100;
  }
  
  void setDistance(float d){
    distanceActivation = d;
  }
  
  
  void display() {
    if (!active) {
      fill(0, 255, 0);
    } else {
      fill(random(255), random(255), random(255));
    }
    ellipse(position.x, position.y, 80, 80);
}

  void update(Player p) {
    distance = PVector.dist(anchor, p.position); //dist pos=enemy et p.pos=player
    float distanceAnchor = PVector.dist(position, anchor); //dist pos ennemy et achor
    
    if (distanceAnchor > elastic) {
      active = false;
    }
    else if (distance < distanceActivation){
      active = true;
    } else {
      active = false;
    }
    
    if (active){
      PVector direction = PVector.sub(p.position, position);
      direction.normalize();
      direction.mult(speed);
      position.add(direction);
    } else {
      PVector retour = PVector.sub(anchor, position);
      retour.normalize();
      retour.mult(2);
      position.add(retour);
    }
  }
  
}
