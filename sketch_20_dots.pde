int num = 26, draw = 0, T = 20;
float[] x = new float[num], y = new float[num];
boolean loop = true;
float time = 0, deltaTime = 0.016;

void setup() {
  size(1020,1020);
  background(255);
  //noLoop();
}

void draw() {
  draw++;
  background(255);
  
  pushMatrix();
  scale(1, -1);
  translate(width/2, -height/2);
  
  for(int i = 0; i < num; i++) {
    noStroke();
    fill(255,0,255);
    
    // El punt del mig es mou més lent que el de fora
    x[i] = 20*i*cos(((2*PI*i)/T)*(time));
    y[i] = 20*i*sin(((2*PI*i)/T)*(time));
    
    
    ellipse(x[i], y[i], 5, 5);
    
    if(i != 0) {
      strokeWeight(1);
      stroke(0);
      line(x[i], y[i], x[i-1], y[i-1]);
    }
  }
  
  time += deltaTime;;
  popMatrix();
  
  //text(int(frameCount/frameRate), 20, 20);
  println(draw);
  
  if(draw >= (T / deltaTime)) {
    noLoop();
  }
}

void keyPressed() {
  switch (key) {
    case 'k':
      if(loop) {
        noLoop();
        loop = !loop;
      } else {
        loop();
        loop = !loop;
      }
      break;
    case 'l':
      //if (!loop) {
        redraw();
      //}
  }
}
