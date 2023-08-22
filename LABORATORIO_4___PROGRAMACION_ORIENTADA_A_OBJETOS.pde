class Estudiante {
  String nombre;
  int edad;
  ArrayList<String> clases;

  Estudiante(String nombre, int edad) {
    this.nombre = nombre;
    this.edad = edad;
    clases = new ArrayList<String>();
  }

  void agregarClase(String nombreClase, int cantidad) {
    for (int i = 0; i < cantidad; i++) {
      clases.add(nombreClase);
    }
  }

  String getInfo() {
    String info = "Nombre: " + nombre + "\nEdad: " + edad + "\nClases inscritas:" ;
    for (String clase : clases) {
      info += "\n- " + clase;
    }
    return info;
  }
}

Estudiante estudiante1, estudiante2;
boolean agregarClaseClicked = false;

void setup() {
  size(400, 600);
  estudiante1 = new Estudiante("Juan", 20);
  estudiante2 = new Estudiante("Maria", 22);

  estudiante1.agregarClase("Matemáticas", 1);
  estudiante1.agregarClase("Historia", 1);

  estudiante2.agregarClase("Programación", 1);
  estudiante2.agregarClase("Arte", 1);

  textAlign(LEFT, TOP);
}

void draw() {
  background(255);
  drawButtons();
  updateInfo();
}

void drawButtons() {
  drawActionButton(20, "Agregar Clase", agregarClaseClicked);
}

void drawActionButton(float y, String label, boolean clicked) {
  float buttonWidth = 70;
  float buttonHeight = 50;
  
  fill(clicked ? color(100, 100, 255) : color(200));
  rect(20, y, buttonWidth, buttonHeight);
  
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text(label, 20 + buttonWidth / 2, y + buttonHeight / 2);
}

void mousePressed() {
  if (mouseX >= 20 && mouseX <= 90 && mouseY >= 20 && mouseY <= 70) {
    agregarClaseClicked = !agregarClaseClicked;
    
    if (agregarClaseClicked) {
      estudiante1.agregarClase("Fisica", 1);
      estudiante1.agregarClase("Computacion", 1);
      estudiante2.agregarClase("Fisica", 1);
      estudiante2.agregarClase("Computacion", 1);
    }
  } else {
    agregarClaseClicked = false;
  }
}

void updateInfo() {
  fill(0);
  textSize(16);
  
  String info = "Información del estudiante 1:\n" + estudiante1.getInfo() +
                "\n\nInformación del estudiante 2:\n" + estudiante2.getInfo();
  text(info, 20, 100, width - 40, height - 120);
}   
