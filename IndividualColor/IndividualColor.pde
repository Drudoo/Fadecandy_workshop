OPC opc;
    color c = color(0,0,255);

void setup() {
  size(500, 500, P3D);
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledGrid8x8(0, width/2, height/2, height / 16.0, 0, false);

}
 
void draw() {
  background(0);
  
  for (int i = 0; i < 8; i++) {
    opc.setPixel(i+8*0, color(255,0,0));
    opc.setPixel(i+8*1, color(0,255,0));
    opc.setPixel(i+8*2, color(0,0,255));
    
    opc.setPixel(i+8*3, color(127,0,0));
    opc.setPixel(i+8*4, color(0,127,0));
    opc.setPixel(i+8*5, color(0,0,127));
    
    opc.setPixel(i+8*6, color(100,100,100));
    opc.setPixel(i+8*7, color(200,200,200));
  }

  opc.writePixels(); 

}
  
  