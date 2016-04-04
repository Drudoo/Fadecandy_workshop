OPC opc;
    color c = color(0,0,255);

void setup() {
  size(500, 500, P3D);
  opc = new OPC(this, "127.0.0.1", 7890);
  opc.ledGrid8x8(0, width/2, height/2, height / 16.0, 0, false);

}
 
void draw() {
  background(0);

}