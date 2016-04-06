OPC opc;
    color c = color(0,0,255);

void setup() {
  size(500, 500, P3D);
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledGrid8x8(0, width/2, height/2, height / 16.0, 0, false);

}
 
void draw() {
  background(0);
  
  for (int i = 0; i < 6; i++) {
    opc.setPixel(8+8*i, color(255,0,0));
  }
  opc.setPixel(8+8*5+1, color(255,0,0));

  for (int i = 0; i < 6; i++) {
    opc.setPixel(11+8*i, color(0,255,0));
  }
  
  for (int i = 0; i < 6; i++) {
    opc.setPixel(13+8*i, color(0,0,255));
  }
  
  opc.setPixel(14, color(0,0,255));
  opc.setPixel(54, color(0,0,255));

  for (int i = 0; i < 4; i++) {
    opc.setPixel(23+8*i, color(0,0,255));
  }

  opc.writePixels(); 

}
  
  