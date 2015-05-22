void linea(int x1, int y1, int x2, int y2) { 
  int x, y, dx, dy, p, form1, form2, auxX, auxY;
  dx = (x2 - x1);
  dy = (y2 - y1);
  if (dy < 0) { 
    dy = -dy; 
    auxY = -1; 
  } 
  else {
    auxY = 1;
  }
 
  if (dx < 0) {  
    dx = -dx;  
    auxX = -1; 
  } 
  else {
    auxX = 1;
  }   
  x = x1;
  y = y1;
  
  if(dx > dy){    
    p = 2*dy - dx;
    form1 = 2*dy;
    form2 = 2*(dy-dx);
    while (x != x2){
      x = x + auxX;
      if (p < 0){
        p = p + form2;
      }
      else {
        y = y + auxY;
        p = p + form1;
      }
       point(x,y);      
    }
  }
  else{   
    p = 2*dx - dy;
    form1 = 2*dx;
    form2 = 2*(dx-dy);
    while (y != y2){
      y = y + auxY;
      if (p < 0){
        p = p + form1;
      }
      else {
        x = x + auxX;
        p = p + form2;
      } 
       point(x,y);      
    }
  }
 }
