class Figura{ 
  int x1, y1, x2, y2,x3,y3,tipo,id,colorArea=255,colorPuntos=0; 
  boolean colision = false;
  boolean traslacion = false;
  boolean rotacion = false;
  int mdist;
  float angulo = 0.0;
  float rad=0;  
  
  Figura (int tipo,int id,int x1, int y1, int x2, int y2) {  
    this.x1 = x1; 
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2; 
    this.tipo = tipo;
    this.id = id;
    
    //3er punto de un triangulo.
    mdist = x2 - x1;
    mdist = mdist/2;
    x3 = x1+mdist;
    y3 =y1-mdist;
  } 
  
  void setAngulo(float a){this.angulo = a;}
  void setX1(int x){this.x1 = x;}
  void setY1(int y){this.y1 = y;}
  void setX2(int x){this.x2 = x;}
  void setY2(int y){this.y2 = y;}
  void setColorArea(int col){  colorArea = col;}
  void setColorPuntos(int col){ colorPuntos = col;}
  
  int getX1(){return x1;}
  int getY1(){return y1;}
  int getX2(){return x2;}
  int getY2(){return y2;}
  int getId(){return id;}
  boolean getColision(){return colision;}
  
  void dibujar(){ 
    switch(this.tipo){
      //LINEA
       case 0:{             
          fill(colorArea);
          line(x1,y1,x2,y2); 
          if(this.colision){
             fill(colorPuntos);
             rectMode(CENTER);
             rect(x1,y1,10,10); 
             rect(x2,y2,10,10); 
          }
      }break; 
      //RECTANGULO
      case 1:{          
          rectMode(CORNERS);
          fill(colorArea);                   
          rect(x1,y1,x2,y2);         
          if(this.colision){
             fill(colorPuntos);
             rectMode(CENTER);
             rect(x1,y1,10,10); 
             rect(x2,y2,10,10); 
          }       
      }break;
      //TRIANGULO
      case 2:{          
          ellipseMode(CORNER);        
          fill(colorArea);         
          triangle(x1,y1,x2,y2,x3,y3); 
          if(this.colision){
             fill(colorPuntos);
             rectMode(CENTER);
             rect(x1,y1,10,10); 
             rect(x2,y2,10,10); 
             rect(x3,y3,10,10); 
          }
      }break;
     //CIRCULO 
      case 3:{
         ellipseMode(CORNER);        
          fill(colorArea);
          ellipse(x1,y1,x2-x1,y2-y1); 
          if(this.colision){
             fill(colorPuntos);
             rectMode(CENTER);
             rect(x1,y1,10,10); 
             rect(x2,y2,10,10); 
          }
      }break;
      
      default:{}break;
    }    
  }
   void colision(int x, int y){     
   if((x > this.x1 && x < this.x2) && (y > this.y1 && y < this.y2)
   || (x > this.x1 && x < this.x2) && (y < this.y1 && y > this.y2) 
   || (x < this.x1 && x > this.x2) && (y > this.y1 && y < this.y2)
   || (x < this.x1 && x > this.x2) && (y < this.y1 && y > this.y2)){      
     colorArea=200;
     colision = true;           
   }else{
     colorArea=255;
     colision = false;
   }   
  } 
  
  void traslacion(){ 
   int dx = x2 - x1;
   int dy = y2 - y1;    
   if((mouseX > this.x1 && mouseX < this.x2) && (mouseY > this.y1 && mouseY < this.y2)
   || (mouseX > this.x1 && mouseX < this.x2) && (mouseY < this.y1 && mouseY > this.y2) 
   || (mouseX < this.x1 && mouseX > this.x2) && (mouseY > this.y1 && mouseY < this.y2)
   || (mouseX < this.x1 && mouseX > this.x2) && (mouseY < this.y1 && mouseY > this.y2)){     
      this.x1 = mouseX-(dx/2);
      this.y1 = mouseY-(dy/2);
      this.x2 = mouseX+(dx/2);
      this.y2 = mouseY+(dy/2);
      //this.x3 = mouseX-(dx/2);
      //this.y3 = mouseY-(dy/2);    
   }  
  } 
  
  void redimensionar (int x, int y){     
   if((x > this.x1-10 && x < this.x1 + 10) && (y > this.y1-10 && y < this.y1 + 10)){
     this.x1 = x;
     this.y1 = y;          
   }   
   if((x > this.x2-10 && x < this.x2 + 10) && (y > this.y2-10 && y < this.y2 + 10)){
     this.x2 = x;
     this.y2 = y;        
   }  
     
   if((x > this.x3-10 && x < this.x3 + 10) && (y > this.y3-10 && y < this.y3 + 10)){
     this.x3 = x;
     this.y3 = y;        
    }   
  }
  
 void rotacion(){
  println("Angulo de la figura: "+angulo);   
  rad = radians(angulo); 
  //rad = angulo; 
  println("Radianes: "+rad);
  // X' = Xc + (X - Xc) Cos0 - (Y - Yc) Sin0
  // Y' = Yc + (X - Xc) Sin0 - (Y - Yc) Cos0

  double xp2 = x1 + (x2 - x1) * Math.cos(rad) - (y2 - y1) * Math.sin(rad); 
  double yp2 = y1 + (x2 - x1) * Math.sin(rad) + (y2 - y1) * Math.cos(rad); 
  
  println("X1: "+x1);
  double xp1 = x1 + (x1 - x1) * Math.cos(rad) - (y1 - y1) * Math.sin(rad); 
  double yp1 = y1 + (x1 - x1) * Math.sin(rad) + (y1 - y1) * Math.cos(rad); 
  println("X1: "+x1);

  
  // X' = X * Cos0 - Y * Sin0
  // Y' = X * sin0 + y * Cos0  
  
  //double xp1 = this.x1 * Math.cos(rad) - this.y1 * Math.sin(rad); 
  //double yp1 = this.x1 * Math.sin(rad) + this.y1 * Math.cos(rad); 
  //double xp2 = this.x2 * Math.cos(rad) - this.y2 * Math.sin(rad); 
  //double yp2 = this.x2 * Math.sin(rad) + this.y2 * Math.cos(rad); 
  
  this.x1 = (int)xp1;
  this.y1 = (int)yp1;
  this.x2 = (int)xp2;
  this.y2 = (int)yp2;  
  }
  
} 
