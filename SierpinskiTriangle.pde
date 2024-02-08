float fillCol;
public void setup() {
  size(750,750);
  background(0);
  fillCol = 0;
}
public void draw() {
  fill(0);
  fillCol+=0.01;
  quad(0,0,0,height,width,height,width,0);
  sierpinski(750,750,width-mouseX,mouseY,fillCol);
  fill(255);
  text("Size: " + (750-mouseX) + "px",0,30);
  if (mouseY > 2) text("Minimum length: " + mouseY + "px",0,60);
  else text("Minimum length: 2px", 0, 60);
}
public void sierpinski(float x, float y, float len, float min, float col) {
  if (min < 5) min = 5;
  System.out.println(min);
  if (len < min) { 
    fill(HSBtoRGB(col, 1, 1));
    triangle(x,y,x-len,y,x-len/2.0,(float)(y-len*Math.sqrt(3)/2.0));
  }
  else {
    sierpinski(x,y,len/2.0,min,col+0.1);
    sierpinski(x-len/2.0,y,len/2.0,min,col+0.1);
    sierpinski(x-len/4.0,(float)(y-len/2.0*Math.sqrt(3)/2.0),len/2.0,min,col);
  }
}
public static int HSBtoRGB(float hue, float saturation, float brightness) {
        int r = 0, g = 0, b = 0;
        if (saturation == 0) {
            r = g = b = (int) (brightness * 255.0f + 0.5f);
        } else {
            float h = (hue - (float)Math.floor(hue)) * 6.0f;
            float f = h - (float)Math.floor(h);
            float p = brightness * (1.0f - saturation);
            float q = brightness * (1.0f - saturation * f);
            float t = brightness * (1.0f - (saturation * (1.0f - f)));
            switch ((int) h) {
            case 0:
                r = (int) (brightness * 255.0f + 0.5f);
                g = (int) (t * 255.0f + 0.5f);
                b = (int) (p * 255.0f + 0.5f);
                break;
            case 1:
                r = (int) (q * 255.0f + 0.5f);
                g = (int) (brightness * 255.0f + 0.5f);
                b = (int) (p * 255.0f + 0.5f);
                break;
            case 2:
                r = (int) (p * 255.0f + 0.5f);
                g = (int) (brightness * 255.0f + 0.5f);
                b = (int) (t * 255.0f + 0.5f);
                break;
            case 3:
                r = (int) (p * 255.0f + 0.5f);
                g = (int) (q * 255.0f + 0.5f);
                b = (int) (brightness * 255.0f + 0.5f);
                break;
            case 4:
                r = (int) (t * 255.0f + 0.5f);
                g = (int) (p * 255.0f + 0.5f);
                b = (int) (brightness * 255.0f + 0.5f);
                break;
            case 5:
                r = (int) (brightness * 255.0f + 0.5f);
                g = (int) (p * 255.0f + 0.5f);
                b = (int) (q * 255.0f + 0.5f);
                break;
            }
        }
        return 0xff000000 | (r << 16) | (g << 8) | (b << 0);
    }
