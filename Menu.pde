void pintarMenu(){
  //MENU
  rectMode(CORNER);
  fill(50);  
  rect(0,0,150,height);
  //
  fill(100);
  // LINE
  rect(1,1,147,100);
  stroke(s1);
  line(10,10,130,90);
  stroke(0);
  //
  fill(100);
  //RECT
  rect(1,1+110,147,100);
  fill(s2);
  rect(10,1+110+10,125,80);
  //
  fill(100);
  //TRIANGLE
  rect(1,1+110+110,147,100);
  fill(s3);
  triangle(10,1+110+110+90,140,1+110+110+90,140/2,225);
  //
  fill(100);
  //ELLIPSE
  rect(1,1+110+110+110,147,100);
  fill(s4);
  ellipseMode(CORNER);  
  ellipse(25,1+110+110+115,90,90);
  //
  fill(100);
  //ELLIPSE
  rect(1,1+110+110+110+110,147,100);  
}

void precionarBotonMenu(){
  if(mouseX > 1 && mouseX < 147 && mouseY>1 && mouseY < 100){
    println("preciono boton linea");
    s1 = color(255,0,0);
    s2 = color(0,0,255);
    s3 = color(0,0,255);
    s4 = color(0,0,255);
    figura=0;
  }
 
   if(mouseX > 1 && mouseX < 147 && mouseY > 1+110 && mouseY < 147+110){
    println("preciono boton rectangulo");
    figura=1;
    s1 = color(0,0,255);
    s2 = color(255,0,0);
    s3 = color(0,0,255);
    s4 = color(0,0,255);
  }
  
   if(mouseX > 1 && mouseX < 147 && mouseY > 1+110+110 && mouseY < 147+110+110){
   println("preciono boton triangulo");
   figura=2;
   s1 = color(0,0,255);
   s2 = color(0,0,255);
   s3 = color(255,0,0);
   s4 = color(0,0,255);
  }
  
  if(mouseX > 1 && mouseX < 147 && mouseY > 1+110+110+110 && mouseY < 147+110+110+110){
   println("preciono boton circulo");
   figura=3;
   s1 = color(0,0,255);
   s2 = color(0,0,255);
   s3 = color(0,0,255);
   s4 = color(255,0,0);
  }
  
   if(mouseX > 1 && mouseX < 147 && mouseY > 1+110+110+110+110 && mouseY < 147+110+110+110+110){
   println("preciono boton limpiado");  
   borrarFiguras();
   s1 = color(0,0,255);
   s2 = color(0,0,255);
   s3 = color(0,0,255);
   s4 = color(0,0,255);
  }
}
