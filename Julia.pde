import com.hamoid.*;

VideoExport videoExport;

float x1 = -1;
float x2 = 1;
float y1 = -1.2;
float y2 = 1.2;
float zoom = 400;
float iteration_max = 100;

float c_r = 0.285;
float c_i = 0.00;

float image_x = (x2 - x1) * zoom;
float image_y = (y2 - y1) * zoom;

void setup() {
  size (1000, 1000);

  videoExport = new VideoExport(this, "2.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  background(255);

  Julia();
  c_i+=0.0002;  

  videoExport.saveFrame();
}

void Julia() {
  for (int x = 0; x < image_x; x++) {
    for (int y = 0; y < image_y; y++) {
      float z_r = x / zoom + x1;
      float z_i = y / zoom + y1;
      float i = 0;

      do {
        float tmp = z_r;
        z_r = z_r*z_r - z_i*z_i + c_r;
        z_i = 2*z_i*tmp + c_i;
        i = i+1;
      } while (z_r*z_r + z_i*z_i < 4 && i < iteration_max);

      if ( i == iteration_max) {
        stroke(getColor(i));
        point(x, y);
      }
      if ( i != iteration_max) {
        //stroke(0,0,i*255/iteration_max);
        stroke(getColor(i));
        point(x, y);
      }
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}

float getColor(float n) {
  n=((sin(n)+1)*255)/2;
  //n = n*255/iteration_max;
  return n;
}
