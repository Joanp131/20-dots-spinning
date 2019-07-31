int num = 26, draw = 0, T = 20;
float[] x = new float[num], y = new float[num];
boolean loop = true;
float time = 0, deltaTime = 0.016 //This 0.016 is the time that elapses from one frame to another 
                                  //(taking into account that this app runs at 60fps);

void setup() {
  size(1020,1020);
  background(255);
  //noLoop();
}

void draw() {
  draw++;
  background(255);
  
  //Set the origin to the center and correct the orientation for the axes
  pushMatrix();
  scale(1, -1);
  translate(width/2, -height/2);
  
  //Draw the dots to its position relative to the time
  for(int i = 0; i < num; i++) {
    noStroke();
    fill(255,0,255);
    
    // El punt del mig es mou més lent que el de fora
    x[i] = 20*i*cos(((2*PI*i)/T)*(time));
    y[i] = 20*i*sin(((2*PI*i)/T)*(time));
    
    
    ellipse(x[i], y[i], 5, 5);
    
    //Draw the lines that connect the dots
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
  
  //Pause the animation the frame before it starts again (to record it and make gifs easier)
  if(draw >= (T / deltaTime)) {
    noLoop();
  }
}

void keyPressed() {
  switch (key) {
    //Pause the animation
    case 'k':
      if(loop) {
        noLoop();
        loop = !loop;
      } else {
        loop();
        loop = !loop;
      }
      break;
    //Move forward one frame when the animation is paused
    case 'l':
      //if (!loop) {
        redraw();
      //}
  }
}
