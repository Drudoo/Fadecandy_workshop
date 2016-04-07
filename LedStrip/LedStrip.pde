OPC opc;

void setup() {
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledStrip(0, 64, width/2, height/2, width / 70.0, 0, false);
}

void draw() {
  opc.setPixel(0, color(255,0,0));
 
  for (int i = 0; i < 8; i++) {
    opc.setPixel(i+8*1, color(255,0,0));
    opc.setPixel(i+8*2, color(0,255,0));
    opc.setPixel(i+8*3, color(0,0,255));
  }
}