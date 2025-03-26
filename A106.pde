/*
 * Le click sur 'A' ou 'a' => allumer/ éteindre la lumière
 * (Quand la lumière est eteinte, le shader par defaut de processing est utilisé)
 * Le click sur ' '(espace) => Descendre ou monter les écrans des Pc
 * Le click sur 'Entrer' => Ouvrir ou fermer la porte de la salle
 * Le click sur 'L' ou 'l' => Rotation du grand écran par -0.1
 * Le click sur 'R' ou 'r' => Rotation du grand écran par 0.1
 * Le click sur 'LEFT' => Déplacer la caméra sur l'axe X vers la gauche
 * Le click sur 'RIGHT' => Déplacer la caméra sur l'axe X vers la droite
 * Le click sur 'TOP' => Déplacer la caméra sur l'axe Y vers le haut
 * Le click sur 'BOTTOM' => Déplacer la caméra sur l'axe Y vers le bas
 * Le click sur 'Z' ou 'z' => Déplacer la caméra sur l'axe Z vers l'arrière
 * Le click sur 'E' ou 'e' => Déplacer la caméra sur l'axe Z vers le bas
 */
Salle salle;
PShader shader;
float camX, camY, camZ;
Boolean allume = true;
PVector[] lightPos;

PVector[] lightColor = {
  new PVector(255, 255, 255),
  new PVector(255, 255, 255),
  new PVector(255, 255, 255),
  new PVector(255, 255, 255),
  new PVector(255, 255, 255),
  new PVector(255, 255, 255)
};

void setup() {
  size(1500, 1000, P3D);
  shader = loadShader("Shader/fragment.glsl", "Shader/vertex.glsl");
  salle = new Salle(height, width, height/2);
  camX=0;
  camY=0;
  camZ=salle.profondeur/2;
  lightPos = new PVector[]{
    new PVector(0, 0, -2*salle.profondeur),
    new PVector(0, 0, 2*salle.profondeur),
    new PVector(2*salle.largeur, 0, 0),
    new PVector(-2*salle.largeur, 0, 0),
    new PVector(0, 2*salle.hauteur, 0),
    new PVector(0, -2*salle.hauteur, 0)
  };
}

void draw() {
  background(100);
  translate(width / 2, height / 2);
  camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
  if (allume) {
    for (int i = 0; i < lightPos.length; i++) {
      pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,
        lightPos[i].x, lightPos[i].y, lightPos[i].z);
    }
  }

  shader(shader);
  salle.draw();
}

void keyPressed() {
  if (key == ' ') salle.bureaux.keyPressed();
  if (key == 'A' || key =='a') allume = !allume;
  if ( key == ENTER || key == 'R' || key =='r'||key == 'L' || key =='l' ) salle.keyPressed();
  float deplacement = 50;
  if (key == CODED) {
    if (keyCode == LEFT)
      camX = constrain(camX - deplacement, -salle.largeur, salle.largeur );
    if (keyCode == RIGHT)
      camX = constrain(camX + deplacement, -salle.largeur, salle.largeur);
    if (keyCode == UP)
      camY = constrain(camY - deplacement, -salle.hauteur, salle.hauteur );
    if (keyCode == DOWN)
      camY = constrain(camY + deplacement, -salle.hauteur, salle.hauteur );
  }
  if (key == 'Z' || key == 'z')
    camZ = constrain(camZ - deplacement, -salle.profondeur, salle.profondeur );
  if (key == 'E' || key == 'e')
    camZ = constrain(camZ + deplacement, -salle.profondeur, salle.profondeur );
}
