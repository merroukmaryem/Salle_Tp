class Bureau {
  PShape bureau;
  EcranPc ecran;
  Clavier clavier;
  Souris souris;
  Unite_centrale uc;
  Chaise chaise;
  PImage tex, tex2, texBlanc;
  boolean ecranMonte = true; // par défaut les écrans sont montés
  float ecranPositionY, posY, posZ; // Position verticale de l'écran


  float largeur, profondeur, hauteur;

  Bureau(float largeur, float profondeur, float hauteur) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur = hauteur;

    ecran = new EcranPc(largeur/2, largeur/3, 3);
    clavier = new Clavier(largeur/2, profondeur/6, 5);
    souris = new Souris(largeur/12, profondeur/6, 5);
    uc = new Unite_centrale(largeur/5, profondeur/3, hauteur*2/3);
    chaise = new Chaise(largeur/3, profondeur/3, 5, 2*hauteur/3, 2*hauteur/3);
    tex = loadImage("Textures/bureau.jpg");
    tex2 = loadImage("Textures/bureau2.jpg");
    texBlanc = loadImage("Textures/blanc.png");
    bureau = creerBureau();
  }

  void draw() {
    shape(bureau);
    // Mise à jour de la position de l'écran selon son état
    if (ecranMonte) {
      ecranPositionY =-hauteur/2 -1.2*ecran.hauteur / 2 -3;
      posY = -hauteur/ 2;
      posZ =profondeur / 4;
    } else {
      ecranPositionY = -ecran.hauteur / 2 -2;
      posY = -hauteur/4;
      posZ = -profondeur / 4;
    }

    pushMatrix();
    translate(0, ecranPositionY, -profondeur/4);
    ecran.draw();
    popMatrix();

    pushMatrix();
    translate(0, posY, posZ);
    clavier.draw();
    popMatrix();

    pushMatrix();
    translate(largeur/3, posY, posZ);
    souris.draw();
    popMatrix();

    pushMatrix();
    translate(largeur/2 - uc.largeur, -hauteur/2 +uc.hauteur/2 +5, profondeur/4);
    uc.draw();
    popMatrix();

    pushMatrix();
    translate(0, -hauteur/2 +chaise.hauteurPieds/2, profondeur/2);
    chaise.draw();
    popMatrix();
  }

  PShape creerBureau() {
    float lx = largeur / 2;
    float lz = profondeur / 2;
    float ly = hauteur / 2;
    // Dimensions des pieds
    float largeurPied = largeur/20;  // Largeur du pied horizontal
    float hauteurPied = hauteur/10;  // Hauteur du pied

    PShape bureau = createShape(GROUP);
    int gris = color(128, 128, 128);

    // Face supérieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(tex);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, 1, 0);
    faceSuperieure.noStroke();
    faceSuperieure.vertex(-lx, -ly, -lz, 0, 0);
    faceSuperieure.vertex(lx, -ly, -lz, 1, 0);
    faceSuperieure.vertex(lx, -ly, lz, 1, 1);
    faceSuperieure.vertex(-lx, -ly, lz, 0, 1);
    faceSuperieure.endShape();
    bureau.addChild(faceSuperieure);


    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(tex2);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, 1);
    faceArriere.noStroke();
    faceArriere.vertex(-lx, -ly, -lz, 0, 0);
    faceArriere.vertex(lx, -ly, -lz, 1, 0);
    faceArriere.vertex(lx, ly, -lz, 1, 1);
    faceArriere.vertex(-lx, ly, -lz, 0, 1);
    faceArriere.endShape();
    bureau.addChild(faceArriere);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(tex2);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 0, -1);
    faceAvant.noStroke();
    faceAvant.vertex(-lx, -ly, -lz/4, 0, 0);
    faceAvant.vertex(lx, -ly, -lz/4, 1, 0);
    faceAvant.vertex(lx, ly, -lz/4, 1, 1);
    faceAvant.vertex(-lx, ly, -lz/4, 0, 1);
    faceAvant.endShape();
    bureau.addChild(faceAvant);
    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(texBlanc);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(-1, 0, 0);
    faceGauche.noStroke();
    faceGauche.tint(gris);
    faceGauche.vertex(-lx, -ly, -lz, 0, 0);
    faceGauche.vertex(-lx, -ly, -lz/4, 1, 0);
    faceGauche.vertex(-lx, ly, -lz/4, 1, 1);
    faceGauche.vertex(-lx, ly, -lz, 0, 1);
    faceGauche.endShape();
    bureau.addChild(faceGauche);

    // Face droite
    PShape faceDroite = createShape();
    faceDroite.beginShape(QUADS);
    faceDroite.textureMode(NORMAL);
    faceDroite.texture(texBlanc);
    faceDroite.shininess(200.0);
    faceDroite.emissive(0, 0, 0);
    faceDroite.normal(1, 0, 0);
    faceDroite.noStroke();
    faceDroite.tint(gris);
    faceDroite.vertex(lx, -ly, -lz, 0, 0);
    faceDroite.vertex(lx, -ly, -lz/4, 1, 0);
    faceDroite.vertex(lx, ly, -lz/4, 1, 1);
    faceDroite.vertex(lx, ly, -lz, 0, 1);
    faceDroite.endShape();
    bureau.addChild(faceDroite);


    // Pied gauche
    PShape piedGauche = createShape(GROUP);

    // Barre horizontale gauche
    PShape barreHorizontaleGauche = createShape();
    barreHorizontaleGauche.beginShape(QUADS);
    barreHorizontaleGauche.textureMode(NORMAL);
    barreHorizontaleGauche.texture(texBlanc);
    barreHorizontaleGauche.shininess(200.0);
    barreHorizontaleGauche.emissive(0, 0, 0);
    barreHorizontaleGauche.normal(0, 0, 1);
    barreHorizontaleGauche.noStroke();
    barreHorizontaleGauche.tint(gris);

    // Face supérieure de la barre
    barreHorizontaleGauche.vertex(-lx, ly - hauteurPied, -lz, 0, 0);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly - hauteurPied, -lz, 1, 0);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly - hauteurPied, lz, 1, 1);
    barreHorizontaleGauche.vertex(-lx, ly - hauteurPied, lz, 0, 1);

    // Face inférieure de la barre
    barreHorizontaleGauche.vertex(-lx, ly, -lz, 0, 0);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly, -lz, 1, 0);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly, lz, 1, 1);
    barreHorizontaleGauche.vertex(-lx, ly, lz, 0, 1);


    // Face gauche
    barreHorizontaleGauche.vertex(-lx, ly - hauteurPied, -lz, 0, 0);
    barreHorizontaleGauche.vertex(-lx, ly - hauteurPied, lz, 1, 0);
    barreHorizontaleGauche.vertex(-lx, ly, lz, 1, 1);
    barreHorizontaleGauche.vertex(-lx, ly, -lz, 0, 1);

    // Face droite
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly - hauteurPied, -lz, 0, 0);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly, -lz, 1, 0);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly, lz, 1, 1);
    barreHorizontaleGauche.vertex(-lx + largeurPied, ly - hauteurPied, lz, 0, 1);

    barreHorizontaleGauche.endShape();
    piedGauche.addChild(barreHorizontaleGauche);
    bureau.addChild(piedGauche);

    // Pied droit
    PShape piedDroit = createShape(GROUP);

    // Barre horizontale droite
    PShape barreHorizontaleDroite = createShape();
    barreHorizontaleDroite.beginShape(QUADS);
    barreHorizontaleDroite.textureMode(NORMAL);
    barreHorizontaleDroite.texture(texBlanc);
    barreHorizontaleDroite.shininess(200.0);
    barreHorizontaleDroite.emissive(0, 0, 0);
    barreHorizontaleDroite.normal(0, 0, 1);
    barreHorizontaleDroite.noStroke();
    barreHorizontaleDroite.tint(gris);
    barreHorizontaleDroite.noStroke();

    // Face supérieure de la barre
    barreHorizontaleDroite.vertex(lx - largeurPied, ly - hauteurPied, -lz, 0, 0);
    barreHorizontaleDroite.vertex(lx, ly - hauteurPied, -lz, 1, 0);
    barreHorizontaleDroite.vertex(lx, ly - hauteurPied, lz, 1, 1);
    barreHorizontaleDroite.vertex(lx - largeurPied, ly - hauteurPied, lz, 0, 1);

    // Face inférieure de la barre
    barreHorizontaleDroite.vertex(lx - largeurPied, ly, -lz, 0, 0);
    barreHorizontaleDroite.vertex(lx, ly, -lz, 1, 0);
    barreHorizontaleDroite.vertex(lx, ly, lz, 1, 1);
    barreHorizontaleDroite.vertex(lx - largeurPied, ly, lz, 0, 1);



    // Face gauche
    barreHorizontaleDroite.vertex(lx - largeurPied, ly - hauteurPied, -lz, 0, 0);
    barreHorizontaleDroite.vertex(lx - largeurPied, ly - hauteurPied, lz, 1, 0);
    barreHorizontaleDroite.vertex(lx - largeurPied, ly, lz, 1, 1);
    barreHorizontaleDroite.vertex(lx - largeurPied, ly, -lz, 0, 1);

    // Face droite
    barreHorizontaleDroite.vertex(lx, ly - hauteurPied, -lz, 0, 0);
    barreHorizontaleDroite.vertex(lx, ly, -lz, 1, 0);
    barreHorizontaleDroite.vertex(lx, ly, lz, 1, 1);
    barreHorizontaleDroite.vertex(lx, ly - hauteurPied, lz, 0, 1);


    barreHorizontaleDroite.endShape();
    piedDroit.addChild(barreHorizontaleDroite);
    bureau.addChild(piedDroit);
    return bureau;
  }


  void keyPressed() {
    if (key == ' ') {
      ecranMonte = !ecranMonte;
    }
  }
}
