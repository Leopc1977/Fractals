// on définit la zone que l'on dessine. Ici, la fractale en entière
float x1 = -2.1;
float x2 = 0.6;
float y1 = -1.2;
float y2 = 1.2;
float zoom = 200; // pour une distance de 1 sur le plan, on a 100 pixel sur l'image
float iteration_max = 100;

// on calcule la taille de l'image :
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
              //stroke(0);
              //stroke(i*255/iteration_max, i*255/iteration_max, i*255/iteration_max);
              point(x,y);
          } else {
            //dessiner avec couleur rgb(0, 0, i*255/iterations_max) le pixel de coordonné (x; x)
            //stroke(i*255/iteration_max, i*255/iteration_max, i*255/iteration_max);
            stroke(0,0, i*255/iteration_max);
            point(x,y);
          }
    }
  }  
}
