float x1 = -2.1;
float x2 = 0.6;
float y1 = -1.2;
float y2 = 1.2;
float zoom = 200;
float iteration_max = 100;

float image_x = (x2 - x1) * zoom;
float image_y = (y2 - y1) * zoom;

void setup(){
  size(500,500);
}

void draw(){
  mandelbrot();
}

void mandelbrot(){
 for (int x = 0 ; x < image_x ;x++){
    for (int y = 0 ; y < image_y ;y++){
          float c_r = x / zoom + x1;
          float c_i = y / zoom + y1;
          float z_r = 0;
          float z_i = 0;
          float i = 0;
  
          do{
              float tmp = z_r;
              z_r = z_r*z_r - z_i*z_i + c_r;
              z_i = 2*z_i*tmp + c_i;
              i = i+1;
          } while(z_r*z_r + z_i*z_i < 4 && i < iteration_max);
  
          if( i == iteration_max){
              point(x,y);
          } else {
            stroke(0,0, i*255/iteration_max);
            point(x,y);
          }
    }
  }  
}
