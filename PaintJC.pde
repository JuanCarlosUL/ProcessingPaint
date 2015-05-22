int x1,y1,x2,y2,c=0,aux=0,figura=-1,modo=1;
float angulo=0;
boolean sel = false;
color s1,s2,s3,s4;

ArrayList<Figura> f;
void setup(){
 // size(1700,700);
  size(800,600);
  f = new ArrayList();
  s1 = color(0,0,255);
  s2 = color(0,0,255);
  s3 = color(0,0,255);
  s4 = color(0,0,255);
}

void draw(){
  background(255);  
  if(f.size() != 0){
    for(int i = 0; i < f.size(); i++){
        f.get(i).dibujar();
    }      
  } 
 pintarMenu();     
}

void borrarFiguras(){
  
    for(int i=0; i < f.size(); i++){      
     if(f.size() == 0){
       println("Vasio");
     }   
     f.remove(i);       
   } 
}

void buscarColision(){  
  //println("Busco");
  for(int i = f.size(); i > 0; i--){      
      f.get(i-1).colision(x1,y2);
      if(f.get(i-1).getColision()){
        aux=i-1;
        sel = true;
         break;
      }else{
        sel = false;
      }
  }  
}
void mouseClicked(){  
   if(mouseButton == LEFT){ 
     buscarColision(); 
     precionarBotonMenu();
   }else{
      for(int i = 0; i < f.size(); i++){      
        if(f.get(i).getColision()){
          f.remove(i);
          aux=0;
          sel= false;
        }
      } 
   }  
}

void mousePressed() {
  if(mouseX > 150){    
    x1 = mouseX;
    y1 = mouseY;      
  }
}

void mouseDragged() {    
    if(f.size() > 0){
      switch(modo){
       case 1:{
         f.get(aux).redimensionar(mouseX,mouseY);     
     
       }break;
       case 2:{             
       }break;
       default:{}break;
      }       
      if(sel == true){        
        f.get(aux).traslacion();
      }      
    }    
}


void mouseReleased() {
    //println("dejar de precionar");       
    if(x1 != x2 && y1 != y2 && x1 != y1 && mouseX > 150 && sel == false){
      x2 = mouseX;
      y2 = mouseY;       
      f.add(new Figura(figura,++c,x1,y1,x2,y2));
      modo=1; 
    }    
}

void keyPressed() {
  println(key);
  if(key == 'q' || key == 'Q'){
    modo=1;
    f.get(aux).setColorPuntos(0);
    println("Redimensionar");
  }
  if(key == 'w' || key == 'W'){
    modo=2;
    f.get(aux).setColorPuntos(255);    
    println("Rotacion");
  } 
}

void mouseWheel(MouseEvent event){
  if(sel == true && modo == 2){ 
    //println("Cambia angulo");
    float e = event.getCount();
    if(e == 1){    
      f.get(aux).setAngulo(1);   
      f.get(aux).rotacion();  
    }else{ 
     f.get(aux).setAngulo(-1); 
     f.get(aux).rotacion();   
    }
  }
}



