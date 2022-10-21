int x;
int y;
int x1 = 10;
int y1 = 10;
PImage img;
boolean flicker = false;
int t = 1;


void setup(){
    img = loadImage("a.png");
    size(1920,1080);
    x = width / 2;
    y = height / 2;
}

void draw (){
     background(0); 
       image(img,x,y);
   if(flicker) {
     int cX = int(random(0,255));
     int cY = int(random(0,255));
     int cZ = int(random(0,255));
     for(int X = x;X<x + img.width;X++){
     for(int Y = y;Y<y+img.height;Y++){
       if(get(X,Y) != color(0,0,0))
         set(X, Y, color(cX,cY,cZ)); 
     }}
   }
   x+=x1;
   y+=y1;
   boolean b = x > width - img.width || x < 0;
   boolean b1 = y > height - img.height || y < 0;
   if (b && b1) {
       thread("run");
       System.out.println("[hit] "+  System.currentTimeMillis());
   }
   if (b)
     x1 = -x1;
   if(b1)
     y1 = -y1;
}

void run(){ //when hitting corner, create a thread to swap flicker mode
  flicker = true;
  long l = System.currentTimeMillis();
  while(System.currentTimeMillis() - l < 1000){
  }
  flicker = false;
}
