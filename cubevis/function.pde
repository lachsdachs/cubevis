float p = 7;
float q = 5;
void function(float t) {
  //p += millis()/1000f;
  x = (2+cos(p*t))*cos(q*t + millis()/1000f)*100;
  y = (2+cos(p*t))*sin(q*t + millis()/1000f)*100;
  z = sin(t*p)*100;
}

//void function(float t) {
//  x = sin(t/10+sin(z/100))*100;
//  y = constrain(cos(t/10)*100+t/x,-100,100);
//  z = cos(cos(t/10)+t)*100;
//}
