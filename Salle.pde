class Salle {
  PShape salle;
  PImage texSol, texPlafond, texMur, texMurFenetre, texPorte, texPorte2, texPrise, texBlanc;

  float largeur, profondeur, hauteur;
  Bureau bureaux;
  Bureau2 bureauProf;
  Tableau tableau;
  G_Ecran ecran;
  Radiateur radiateur;
  Boitier boitier;
  Speaker speaker;
  PShape porte, prise;
  float PHI = PI/4;
  float Alpha= PI/2;
  Boolean porteFermee=true; //la porte est par défaut fermée
  int noir = color(0, 0, 0);

  Salle(float largeur, float profondeur, float hauteur) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur = hauteur;
    texSol = loadImage("Textures/sol.jpg");
    texPlafond = loadImage("Textures/plafond.jpg");
    texMur = loadImage("Textures/mur.jpg");
    texMurFenetre = loadImage("Textures/fenetre.jpeg");
    texPorte = loadImage("Textures/porte.jpg");
    texPorte2 = loadImage("Textures/porteA106.png");
    texPrise = loadImage("Textures/prise.jpeg");
    texBlanc = loadImage("Textures/blanc.png");
    salle = creerSalle(largeur, profondeur, hauteur);
    float largeurBureau = largeur/8;
    float profondeurBureau = profondeur*0.06;
    float hauteurBureau = hauteur * 0.2;
    bureaux = new Bureau(largeurBureau, profondeurBureau, hauteurBureau);
    bureauProf = new Bureau2(2*largeurBureau, profondeurBureau, hauteurBureau, hauteurBureau/2);

    tableau = new Tableau(largeur*2/3, 5, hauteur / 2);
    ecran = new G_Ecran(largeur/3, 5, hauteur/2, largeur/10, 5, hauteur/4);
    porte = creerPorte(largeur/5, 5, hauteur*3/4);
    radiateur = new Radiateur(largeur/3, 15, hauteur/4);
    boitier = new Boitier(largeur/12, 10, hauteur/6);
    speaker = new Speaker(largeur/20, hauteur/8, 50);
    prise = creerPrise(15, 15);
  }

  void draw() {
    shape(salle);
    float espaceAvant = profondeur * 0.3;  // Espace devant
    float espacementLignes = profondeur * 0.04;  // Petit espace entre rangées

    float largeurBureau = largeur/8;
    float profondeurBureau = profondeur * 0.10;

    for (int i = 0; i < 5; i++) {// 5 rangées
      int nb;
      if (i==0) {
        nb=4;
        pushMatrix();
        // la position du bureau du prof
        float x = largeur/2  - (5* (largeurBureau+1));
        float y = hauteur/2 - bureauProf.hauteur/2;
        float z = -profondeur/2 + espaceAvant + (i * (profondeurBureau + espacementLignes));
        translate(x, y, z);
        rotateY(PI);
        bureauProf.draw();
        popMatrix();
      } else if (i==4) {
        nb=3;
      } else {
        nb=6;
      }
      for (int j = 0; j < nb; j++) {
        pushMatrix();
        //la position de chaque bureau
        float x = (largeur / 2) - largeurBureau/2 - (j * (largeurBureau+1))-0.01;
        float y = hauteur/2 - bureaux.hauteur/2;
        float z = -profondeur/2 + espaceAvant + (i * (profondeurBureau + espacementLignes));
        translate(x, y-1, z);
        bureaux.draw();
        popMatrix();
      }
    }

    //le tableau
    pushMatrix();
    translate(110, -hauteur / 4+tableau.hauteur/2, -profondeur / 2 +tableau.profondeur/2+1);  // Position devant la face avant
    tableau.draw();
    popMatrix();

    //l'écran
    pushMatrix();
    translate(-largeur/2+ecran.largeur/2, hauteur/2 -ecran.hauteur/2-ecran.hauteurSupport -1, -profondeur /2+ecran.largeur/2);
    rotateY(PHI);
    ecran.draw();
    popMatrix();

    //la porte sur la face avant
    pushMatrix();
    float positionXAvant = -largeur/3;
    float positionYAvant = hauteur/8;
    float positionZAvant = -profondeur / 2 +1;
    translate(positionXAvant, positionYAvant, positionZAvant);
    rotateY(PI);
    shape(porte);
    popMatrix();

    //la porte sur la face arrière
    pushMatrix();
    float positionXArriere = -largeur/3;
    float positionYArriere = hauteur / 8;
    float positionZArriere = profondeur / 2 -1;
    translate(positionXArriere, positionYArriere, positionZArriere);
    shape(porte);
    popMatrix();

    //la porte sur la face droite
    pushMatrix();
    float positionXDroite = largeur / 2;
    float positionYDroite = hauteur /8;
    float positionZDroite = -profondeur/2+largeur/10;
    translate(positionXDroite, positionYDroite, positionZDroite);
    rotateY(Alpha);
    translate(-largeur / 10, 0, 0);
    shape(porte);
    popMatrix();

    //Place de la porte lorsqu'elle est ouverte
    pushMatrix();
    translate(positionXDroite-0.05, positionYDroite, positionZDroite);
    rotateY(PI/2);
    translate(-largeur / 10, 0, 0);
    PShape placePorte=createShape();
    placePorte.beginShape(QUADS);
    placePorte.textureMode(NORMAL);
    placePorte.texture(texBlanc);
    placePorte.shininess(200.0);
    placePorte.emissive(0, 0, 0);
    placePorte.normal(1, 0, 0);
    placePorte.noStroke();
    placePorte.tint(color(128, 128, 128));
    placePorte.vertex(-largeur/10, -hauteur*3/8, 0, 0, 0);
    placePorte.vertex(largeur/10, -hauteur*3/8, 0, 1, 0);
    placePorte.vertex(largeur/10, hauteur*3/8, 0, 1, 1);
    placePorte.vertex(-largeur/10, hauteur*3/8, 0, 0, 1);
    placePorte.endShape();
    shape(placePorte);
    popMatrix();

    //le boitier
    pushMatrix();
    float Bx = largeur/2 - boitier.profondeur/2-1;
    float Bz = -profondeur/4;
    translate(Bx, 0, Bz);
    rotateY(-PI/2);
    boitier.draw();
    popMatrix();

    //les prises
    for (int i = 0; i < 6; i++) {
      pushMatrix();
      float Px = largeur / 2 - 1;
      float Py = hauteur / 4;
      float Pz = -profondeur / 4 + i * (profondeur / 10);
      translate(Px, Py, Pz);
      rotateY(-PI/2); // Alignés avec le mur
      shape(prise);
      popMatrix();
    }


    //les radiateurs
    pushMatrix();
    float Rx = -largeur/2 + radiateur.profondeur/2+1;
    float Ry = hauteur/3;
    float Rz = 0 ;
    translate(Rx, Ry, Rz);
    rotateY(PI/2);
    radiateur.draw(); //premier radiateur
    popMatrix();

    pushMatrix();
    float Rz2 = profondeur / 2-radiateur.largeur/2 ;
    translate(Rx, Ry, Rz2);
    rotateY(PI/2);
    radiateur.draw(); //deuxième radiateur
    popMatrix();

    //les speakers
    pushMatrix();
    translate(largeur/3, -hauteur/2+speaker.hauteur, -profondeur / 2 +speaker.profondeur/2+1);
    speaker.draw(); //premier speaker
    popMatrix();

    pushMatrix();
    translate(-largeur/3, -hauteur/2+speaker.hauteur, -profondeur / 2 +speaker.profondeur/2+1);
    speaker.draw(); //deuxième speaker
    popMatrix();
  }

  PShape creerSalle(float largeur, float profondeur, float hauteur) {
    float lx = largeur / 2;
    float lz = profondeur / 2;
    float ly = hauteur / 2;

    PShape salle = createShape(GROUP);

    // Face supérieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(texPlafond);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, -1, 0);
    faceSuperieure.noStroke();
    faceSuperieure.vertex(-lx, -ly, -lz, 1, 0);
    faceSuperieure.vertex(lx, -ly, -lz, 1, 1);
    faceSuperieure.vertex(lx, -ly, lz, 0, 1);
    faceSuperieure.vertex(-lx, -ly, lz, 0, 0);
    faceSuperieure.endShape();
    salle.addChild(faceSuperieure);

    // Face inférieure
    PShape faceInferieure = createShape();
    faceInferieure.beginShape(QUADS);
    faceInferieure.textureMode(NORMAL);
    faceInferieure.texture(texSol);
    faceInferieure.shininess(200.0);
    faceInferieure.emissive(0, 0, 0);
    faceInferieure.normal(0, 1, 0);
    faceInferieure.noStroke();
    faceInferieure.vertex(-lx, ly, -lz, 0, 0);
    faceInferieure.vertex(lx, ly, -lz, 1, 0);
    faceInferieure.vertex(lx, ly, lz, 1, 1);
    faceInferieure.vertex(-lx, ly, lz, 0, 1);
    faceInferieure.endShape();
    salle.addChild(faceInferieure);

    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(texMur);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, 1);
    faceArriere.noStroke();
    faceArriere.vertex(-lx, -ly, lz, 0, 0);
    faceArriere.vertex(lx, -ly, lz, 1, 0);
    faceArriere.vertex(lx, ly, lz, 1, 1);
    faceArriere.vertex(-lx, ly, lz, 0, 1);
    faceArriere.endShape();
    salle.addChild(faceArriere);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(texMur);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 0, -1);
    faceAvant.noStroke();
    faceAvant.vertex(-lx, -ly, -lz, 0, 0);
    faceAvant.vertex(lx, -ly, -lz, 1, 0);
    faceAvant.vertex(lx, ly, -lz, 1, 1);
    faceAvant.vertex(-lx, ly, -lz, 0, 1);
    faceAvant.endShape();
    salle.addChild(faceAvant);

    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(texMurFenetre);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(-1, 0, 0);
    faceGauche.noStroke();
    faceGauche.vertex(-lx, -ly, -lz, 0, 0);
    faceGauche.vertex(-lx, -ly, lz, 1, 0);
    faceGauche.vertex(-lx, ly, lz, 1, 1);
    faceGauche.vertex(-lx, ly, -lz, 0, 1);
    faceGauche.endShape();
    salle.addChild(faceGauche);

    // Face droite
    PShape faceDroite = createShape();
    faceDroite.beginShape(QUADS);
    faceDroite.textureMode(NORMAL);
    faceDroite.texture(texMur);
    faceDroite.shininess(200.0);
    faceDroite.emissive(0, 0, 0);
    faceDroite.normal(1, 0, 0);
    faceDroite.noStroke();
    faceDroite.vertex(lx, -ly, -lz, 0, 0);
    faceDroite.vertex(lx, -ly, lz, 1, 0);
    faceDroite.vertex(lx, ly, lz, 1, 1);
    faceDroite.vertex(lx, ly, -lz, 0, 1);
    faceDroite.endShape();
    salle.addChild(faceDroite);

    return salle;
  }

  PShape creerPorte(float largeur, float profondeur, float hauteur) {
    PShape porte = createShape(GROUP);
    float lx = largeur/2;
    float ly = hauteur/2;
    float lz = profondeur/2;
    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(texPorte);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, 1);
    faceArriere.noStroke();
    faceArriere.vertex(-lx, -ly, -lz, 0, 0);
    faceArriere.vertex(lx, -ly, -lz, 1, 0);
    faceArriere.vertex(lx, ly, -lz, 1, 1);
    faceArriere.vertex(-lx, ly, -lz, 0, 1);
    faceArriere.endShape();
    porte.addChild(faceArriere);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(texPorte2);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 0, -1);
    faceAvant.noStroke();
    faceAvant.vertex(-lx, -ly, lz, 0, 0);
    faceAvant.vertex(lx, -ly, lz, 1, 0);
    faceAvant.vertex(lx, ly, lz, 1, 1);
    faceAvant.vertex(-lx, ly, lz, 0, 1);
    faceAvant.endShape();
    porte.addChild(faceAvant);

    return porte;
  }
  PShape creerPrise(float largeur, float hauteur) {
    PShape prise = createShape();
    float lx = largeur/2;
    float ly = hauteur/2;
    prise.beginShape(QUADS);
    prise.textureMode(NORMAL);
    prise.texture(texPrise);
    prise.shininess(200.0);
    prise.emissive(0, 0, 0);
    prise.normal(0, 0, -1);
    prise.noStroke();
    prise.vertex(-lx, -ly, 0, 0, 0);
    prise.vertex(lx, -ly, 0, 1, 0);
    prise.vertex(lx, ly, 0, 1, 1);
    prise.vertex(-lx, ly, 0, 0, 1);

    prise.endShape();
    return prise;
  }

  void keyPressed() {
    if (key == 'L' || key =='l') {
      PHI -=0.1;
    }
    if (key == 'R' || key =='r') {
      PHI +=0.1;
    }
    if (key == ENTER) {
      if (porteFermee) Alpha =0;
      else Alpha = PI/2;
      porteFermee = !porteFermee;
    }
  }
}
