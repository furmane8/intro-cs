/* Game description: The idea behind this game is a dungeon crawler type game where you //<>//
 have waves of zombies and fire monster enemies. If I had more time, I could have added
 another class of enemy and added more levels to make it harder. I also could have made
 more animations for the enemies or I could have changed the knight animation to flip
 back and forth. The most challenging parts of this was making the animations and making
 the fire monster mechanics (including the fireballs and targeting code). It was fun to
 design the game and figure out the zombie "heat seeking" code (and it was fun to just
 play my own game). I had to figure out the fire monster and zombie mechanics on my own,
 but I got a little help with the animations and the attacking code from Ms. Feng.
 
 Peer review: Two peer edits from Emily P. and Emily T. were to make a better home screen
 with a tutorial, and to add an attacking animation to help the player see when they are
 attacking. I included both of these suggestions in my code. Some other people that
 looked at my game suggested that I changed my movement system so that you don't
 slide when you aren't pressing a key, and I also implemented that. */

int gameStage = 1; //stage of the game (0 = help, 1 = start, ..., 7 = win)
int countdown = 0; //countdown (1 per frame)
int crowny = -100; //position of crown for win screen

int knightx = 500; //knight x
int knighty = 500; //knight y
int dx = 0; //change in knight x
int dy = 0; //change in knight y
float speed = 8; //knight speed
int health = 10; //knight health
boolean attack = false; //attacking boolean
int attackCountdown = 0; //attacking countdwon for animation/timing
int frameCounter = 0; //counter for animation

int zombienumber = 6; //number of zombies
int[] zombiex = new int[zombienumber]; //zombie x
int[] zombiey = new int[zombienumber]; //zombie y
int[] zombiehealth = new int[zombienumber]; //zombie health
boolean[] zombiedeath = new boolean[zombienumber]; //zombie death boolean

int firenumber = 5; //number of fire monsters
int[] firex = new int[firenumber]; //fire monster x
int[] firey = new int[firenumber]; //fire monster y
int[] fireballx = new int[firenumber]; //fireball x
int[] firebally = new int[firenumber]; //fireball y
int[] firetargetx = new int[firenumber]; //where the fireball is going x
int[] firetargety = new int[firenumber]; //where the fireball is going y
boolean[] firedeath = new boolean[firenumber]; //fire monster death boolean

int powerupx = -100; //powerup x
int powerupy = -100; //powerup y

PImage powerup;
PImage[] knightSprite = new PImage[4];
PImage[] attackingSprite = new PImage[7];
PImage background;
PImage help;
PImage zombieSprite;
PImage fireSprite;
PImage heart;
PImage keyIcon;
PImage fireball;
PImage crown;
PFont font;

void setup () {

  size(1000, 700);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);

  powerup = loadImage("damage_image.png");
  background = loadImage("background.jpg");
  help = loadImage("help.png");
  zombieSprite = loadImage("zombie_sprite.png");
  fireSprite = loadImage("fire_sprite.png");
  heart = loadImage("health.png");
  keyIcon = loadImage("key_icon.png");
  fireball = loadImage("fireball.png");
  crown = loadImage("crown.png");
  font = createFont("pixel_font.ttf", 128);
  textFont(font);

  for (int x = 0; x < 7; x ++) {
    attackingSprite[x] = loadImage("attack"+x+".png");
  }
  for (int x = 0; x < 4; x ++) {
    knightSprite[x] = loadImage("knight"+x+".png");
  }

  //resetting zombie stuff

  for (int x = 0; x < zombienumber; x ++) {
    zombiex[x] = (int) random(100, width - 100);
    zombiey[x] = (int) random(100, height - 100);
    zombiehealth[x] = 2;
    zombiedeath[x] = false;
  }

  //resetting fire monster stuff

  for (int x = 0; x < firenumber; x ++) {
    firex[x] = (int) random(250, 750);
    firey[x] = (int) random(150, 550);
    fireballx[x] = firex[x];
    firebally[x] = firey[x];
    firetargetx[x] = firex[x];
    firetargety[x] = firey[x];
    firedeath[x] = false;
  }
}

void draw () {

  countdown = countdown + 1;
  health = restriction(health, 0, 10);

  //help screen

  if (gameStage == 0) {
    fill(0);
    rect(500, 350, 1000, 700);
    image(help, 500, 350, 1000, 700);
    if (mousePressed) {
      gameStage = 1;
    }
  }

  //start screen

  if (gameStage == 1) {
    health = 10;
    knightx = 500;
    knighty = 500;
    dx = 0;
    dy = 0;
    countdown = 0;

    fill(0);
    rect(500, 350, 1000, 700);
    image(knightSprite[0], 500, 307, 184, 240);
    fill(255);
    textSize(75);
    text("CHAMPION'S QUEST", 500, 190);
    fill(100);
    rect(500, 460, 680, 50);
    rect(500, 580, 680, 50);
    textSize(30);
    fill(255);
    text("CLICK HERE TO START", 500, 470);
    text("CLICK HERE FOR HELP", 500, 590);
    if ((mouseX < 840 && mouseX > 160) && (mouseY < 490 && mouseY > 440)) {
      fill(255, 0, 0);
      rect(500, 460, 680, 50);
      textSize(30);
      fill(255);
      text("CLICK HERE TO START", 500, 470);
      if (mousePressed) {
        gameStage = 2;
        zombienumber = 3;
        countdown = 0;
      }
    } else if ((mouseX < 840 && mouseX > 160) && (mouseY < 610 && mouseY > 560)) {
      fill(255, 0, 0);
      rect(500, 580, 680, 50);
      textSize(30);
      fill(255);
      text("CLICK HERE FOR HELP", 500, 590);
      if (mousePressed) {
        gameStage = 0;
      }
    }
  }

  //stage 1 - zombies, part 1 (3 zombies)

  if (gameStage == 2) {
    image(background, 500, 350, 1225, 700);
    push();
    fill(100, 150);
    rect(500, 350, 1000, 700);
    pop();

    //knight sprite
    knight(knightx, knighty, attack);
    if (attack == true) {
      attackCountdown ++;
    } else if (attack == false) {
      attackCountdown = 0;
    }
    if (attackCountdown > 14) {
      attackCountdown = 0;
    }

    zombieLevel(3);

    if (zombiedeath[0] == true && zombiedeath[1] == true && zombiedeath[2] == true) {
      image(keyIcon, 500, 350, 86, 38);
      if (abs(500 - knightx) < 80 && abs(350 - knighty) < 40) {
        gameStage = 3;
        firenumber = 2;
        countdown = 0;

        for (int x = 0; x < firenumber; x ++) {
          firex[x] = (int) random(250, 750);
          firey[x] = (int) random(150, 550);
          fireballx[x] = firex[x];
          firebally[x] = firey[x];
          firetargetx[x] = firex[x];
          firetargety[x] = firey[x];
          firedeath[x] = false;
        }
      }
    }

    healthbar();
    powerup();
    textSize(20);
    text("Level: 1", 800, 50);
    if (health < 1) {
      death();
    }
  }

  //stage 2 - fire monsters, part 1 (2 monsters)

  if (gameStage == 3) {
    image(background, 500, 350, 1225, 700);
    push();
    fill(100, 150);
    rect(500, 350, 1000, 700);
    pop();

    //knight sprite
    knight(knightx, knighty, attack);
    if (attack == true) {
      attackCountdown ++;
    } else {
      attackCountdown = 0;
    }
    if (attackCountdown > 14) {
      attackCountdown = 0;
    }

    fireLevel(2);

    if (firedeath[0] == true && firedeath[1] == true) {
      image(keyIcon, 500, 350, 86, 38);
      if (abs(500 - knightx) < 80 && abs(350 - knighty) < 40) {
        gameStage = 4;
        zombienumber = 6;
        countdown = 0;

        for (int x = 0; x < zombienumber; x ++) {
          zombiex[x] = (int) random(100, width - 100);
          zombiey[x] = (int) random(100, height - 100);
          zombiehealth[x] = 2;
          zombiedeath[x] = false;
        }
      }
    }

    healthbar();
    powerup();
    push();
    textSize(20);
    text("Level: 2", 800, 50);
    pop();
    if (health < 1) {
      death();
    }
  }

  //stage 3 - zombies, part 2 (6 zombies)

  if (gameStage == 4) {
    zombienumber = 6;
    image(background, 500, 350, 1225, 700);
    push();
    fill(100, 150);
    rect(500, 350, 1000, 700);
    pop();

    //knight sprite
    knight(knightx, knighty, attack);
    if (attack == true) {
      attackCountdown ++;
    } else if (attack == false) {
      attackCountdown = 0;
    }
    if (attackCountdown > 14) {
      attackCountdown = 0;
    }

    zombieLevel(6);

    if (zombiedeath[0] == true && zombiedeath[1] == true && zombiedeath[2] == true &&
      zombiedeath[3] == true && zombiedeath[4] == true && zombiedeath[5] == true) {
      image(keyIcon, 500, 350, 86, 38);
      if (abs(500 - knightx) < 80 && abs(350 - knighty) < 40) {
        gameStage = 5;
        firenumber = 5;
        countdown = 0;

        for (int x = 0; x < firenumber; x ++) {
          firex[x] = (int) random(250, 750);
          firey[x] = (int) random(150, 550);
          fireballx[x] = firex[x];
          firebally[x] = firey[x];
          firetargetx[x] = firex[x];
          firetargety[x] = firey[x];
          firedeath[x] = false;
        }
      }
    }

    healthbar();
    powerup();
    push();
    textSize(20);
    text("Level: 3", 800, 50);
    pop();
    if (health < 1) {
      death();
    }
  }

  // stage 4 - fire monsters part 2, 5 monsters

  if (gameStage == 5) {
    firenumber = 5;
    image(background, 500, 350, 1225, 700);
    push();
    fill(100, 150);
    rect(500, 350, 1000, 700);
    pop();

    //knight sprite
    knight(knightx, knighty, attack);
    if (attack == true) {
      attackCountdown ++;
    } else {
      attackCountdown = 0;
    }
    if (attackCountdown > 14) {
      attackCountdown = 0;
    }

    fireLevel(5);

    if (firedeath[0] == true && firedeath[1] == true && firedeath[2] == true &&
      firedeath[3] == true && firedeath[4] == true) {
      image(keyIcon, 500, 350, 86, 38);
      if (abs(500 - knightx) < 80 && abs(350 - knighty) < 40) {
        gameStage = 6;
        zombienumber = 5;
        firenumber = 3;
        countdown = 0;

        for (int x = 0; x < zombienumber; x ++) {
          zombiex[x] = (int) random(100, width - 100);
          zombiey[x] = (int) random(100, height - 100);
          zombiehealth[x] = 2;
          zombiedeath[x] = false;
        }

        for (int x = 0; x < firenumber; x ++) {
          firex[x] = (int) random(250, 750);
          firey[x] = (int) random(150, 550);
          fireballx[x] = firex[x];
          firebally[x] = firey[x];
          firetargetx[x] = firex[x];
          firetargety[x] = firey[x];
          firedeath[x] = false;
        }
      }
    }

    healthbar();
    powerup();
    push();
    textSize(20);
    text("Level: 4", 800, 50);
    pop();
    if (health < 1) {
      death();
    }
  }

  //stage 5 - boss level, 5 zombies and 3 fire monsters

  if (gameStage == 6) {
    zombienumber = 5;
    firenumber = 3;
    image(background, 500, 350, 1225, 700);
    push();
    fill(100, 150);
    rect(500, 350, 1000, 700);
    pop();

    //knight sprite
    knight(knightx, knighty, attack);
    if (attack == true) {
      attackCountdown ++;
    } else {
      attackCountdown = 0;
    }
    if (attackCountdown > 14) {
      attackCountdown = 0;
    }

    zombieLevel(5);
    fireLevel(3);

    if (zombiedeath[0] == true && zombiedeath[1] == true && zombiedeath[2] == true &&
      zombiedeath[3] == true && zombiedeath[4] == true && firedeath[0] == true &&
      firedeath[1] == true && firedeath[2] == true) {
      image(keyIcon, 500, 350, 86, 38);
      if (abs(500 - knightx) < 80 && abs(350 - knighty) < 40) {
        gameStage = 7;
      }
    }

    healthbar();
    powerup();
    push();
    textSize(20);
    text("Level: 5", 800, 50);
    pop();
    if (health < 1) {
      death();
    }
  }

  //win screen

  if (gameStage == 7) {
    fill(0);
    rect(500, 350, 1000, 700);
    image(knightSprite[0], 500, 350, 198, 258);
    textSize(90);
    fill(0, 255, 0);
    text("YOU WON!", 500, 230);
    image(crown, 520, crowny, 61, 40);
    fill(100);
    rect(500, 510, 680, 50);
    textSize(30);
    fill(255);
    text("CLICK HERE TO RETURN TO MENU", 500, 520);

    if (crowny < 310) {
      crowny ++;
    } else if (crowny >= 310) {
      crowny = 310;
    }

    if ((mouseX < 840 && mouseX > 160) && (mouseY < 540 && mouseY > 485)) {
      fill(255, 0, 0);
      rect(500, 510, 680, 50);
      textSize(30);
      fill(255);
      text("CLICK HERE TO RETURN TO MENU", 500, 520);
      if (mousePressed) {
        gameStage = 1;
      }
    }
  }
}

void zombieLevel (int zombienumber) {
  //zombiesprite
  for (int x = 0; x < zombienumber; x ++) {
    image(zombieSprite, zombiex[x], zombiey[x], 64, 64);
    if (zombiehealth[x] != 0) {
      if (zombiex[x] < knightx) {
        zombiex[x] = zombiex[x] + 2;
      } else if (zombiex[x] > knightx) {
        zombiex[x] = zombiex[x] - 2;
      }
      if (zombiey[x] < knighty) {
        zombiey[x] = zombiey[x] + 2;
      } else if (zombiex[x] > knighty) {
        zombiey[x] = zombiey[x] - 2;
      }
    }

    push();
    textSize(20);
    text(zombiehealth[x], zombiex[x], zombiey[x]);
    pop();

    //getting hit by enemies
    if (abs(zombiex[x] - knightx) < 45 && abs(zombiey[x] - knighty) < 55) {
      if (countdown % 20 == 0) {
        fill(255, 0, 0, 100);
        rect(500, 350, 1000, 700);
        health = health - 1;
      }
    }

    //hitting enemies
    if (abs(zombiex[x] - knightx) < 75 && abs(zombiey[x] - knighty) < 85) {
      if (attack == true) {
        if (attackCountdown <= 14 && attackCountdown > 13) {
          zombiehealth[x] --;
        }
      }
    }

    //enemy death
    if (zombiehealth[x] == 0) {
      zombiedeath[x] = true;
      zombiex[x] = -100;
      zombiey[x] = -100;
    }
  }
}

void fireLevel (int firenumber) {
  //fire monster sprite
  for (int x = 0; x < firenumber; x ++) {
    image(fireSprite, firex[x], firey[x], 64, 64);

    if (firedeath[x] == false) {
      push();
      textSize(20);
      text("1", firex[x] + 7, firey[x] + 15);
      pop();
    }

    if (countdown % 100 > 90 && countdown % 100 < 95) {
      fireballx[x] = firex[x];
      firebally[x] = firey[x];
      firetargetx[x] = firex[x];
      firetargety[x] = firey[x];
    }

    if (countdown % 100 > 0 && countdown % 100 < 2) {
      firetargetx[x] = knightx;
      firetargety[x] = knighty;
    }
    push();
    fill(180, 66, 63);
    image(fireball, fireballx[x], firebally[x], 30, 30);
    pop();
    if (fireballx[x] != -100 && firebally[x] != -100) {
      if (fireballx[x] < firetargetx[x]) {
        fireballx[x] = fireballx[x] + 5;
      } else if (fireballx[x] > firetargetx[x]) {
        fireballx[x] = fireballx[x] - 5;
      }
      if (firebally[x] < firetargety[x]) {
        firebally[x] = firebally[x] + 5;
      } else if (firebally[x] > firetargety[x]) {
        firebally[x] = firebally[x] - 5;
      }
    }

    //collision system
    //getting hit by fireballs
    if (dist(fireballx[x], firebally[x], knightx, knighty) < 35) {
      fill(255, 0, 0, 100);
      rect(500, 350, 1000, 700);
      health = health - 2;
      fireballx[x] = -100;
      firebally[x] = -100;
    }

    //hitting enemies
    if (abs(firex[x] - knightx) < 75 && abs(firey[x] - knighty) < 85) {
      if (attack == true) {
        if (attackCountdown <= 14 && attackCountdown > 13) {
          firedeath[x] = true;
          firex[x] = -100;
          firey[x] = -100;
        }
      }
    }
  }
}

void knight (int x, int y, boolean animation) {
  knightx = restriction(knightx, 20, width - 20);
  knighty = restriction(knighty, 20, height - 20);
  dx = restriction(dx, -3, 3);
  dy = restriction(dy, -3, 3);
  knightx += dx;
  knighty += dy;
  if (keyPressed == false) {
    dx = 0;
    dy = 0;
  }

  if (animation == false) {
    if (keyPressed == false) {
      image(attackingSprite[0], x, y, 140, 106);
    } else {
      if (countdown % 3 == 0) {
        frameCounter ++;
      }
      if (frameCounter > 3) {
        frameCounter = 0;
      }
      image(knightSprite[frameCounter], x, y, 96, 116);
    }
  } else if (animation == true) {
    if (countdown % 2 == 0) {
      frameCounter ++;
    }
    if (frameCounter > 6) {
      frameCounter = 0;
    }
    image(attackingSprite[frameCounter], x, y, 140, 106);
  }
}

void healthbar () {
  fill(200);
  rect(205, 49, 350, 40);
  for (int x = 0; x < health; x ++) {
    image(heart, 50 + 35 * x, 50, 30, 30);
  }
}

void powerup () {
  image(powerup, powerupx, powerupy, 64, 52);

  if (countdown % 300 == 0) {
    powerupx = (int) random(200, width - 200);
    powerupy = (int) random(100, height - 100);
  }

  if (abs(knightx - powerupx) < 60 && abs(knighty - powerupy) < 80) {
    health = health + 2;
    powerupx = -100;
    powerupy = -100;
  }
}

void death () {
  fill(0);
  rect(500, 350, 1000, 700);
  textSize(60);
  fill(255, 0, 0);
  text("YOU DIED. GAME OVER", 500, 350);
  fill(100);
  rect(500, 410, 680, 50);
  textSize(30);
  fill(255);
  text("CLICK HERE TO RESTART", 500, 420);

  if ((mouseX < 840 && mouseX > 160) && (mouseY < 440 && mouseY > 390)) {
    fill(255, 0, 0);
    rect(500, 410, 680, 50);
    textSize(30);
    fill(255);
    text("CLICK HERE TO RESTART", 500, 420);
    if (mousePressed) {
      gameStage = 1;
      for (int x = 0; x < zombienumber; x ++) {
        zombiex[x] = (int) random(100, width - 100);
        zombiey[x] = (int) random(100, height - 100);
        zombiehealth[x] = 2;
        zombiedeath[x] = false;
      }
      for (int x = 0; x < firenumber; x ++) {
        firex[x] = (int) random(250, 750);
        firey[x] = (int) random(150, 550);
        fireballx[x] = firex[x];
        firebally[x] = firey[x];
        firetargetx[x] = knightx;
        firetargety[x] = knighty;
        firedeath[x] = false;
      }
    }
  }
}

void keyPressed () {

  //knight movement

  if (key == 'w') {
    dy -= speed;
  }
  if (key == 's') {
    dy += speed;
  }
  if (key == 'd') {
    dx += speed;
  }
  if (key == 'a') {
    dx -= speed;
  }
  if (keyCode == ' ') {
    attack = true;
  }
}

void keyReleased () {

  //knight attack
  if (keyCode == ' ') {
    attack = false;
  }
}

int restriction(int input, int min, int max) {
  if (input > max) {
    return max;
  } else if (input < min) {
    return min;
  } else {
    return input;
  }
}
