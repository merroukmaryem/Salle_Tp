class Boitier {
  PShape boitier;
  PImage tex, texBlanc ;
  // Dimensions
  float largeur, profondeur, hauteur;

  Boitier(float largeur, float profondeur, float hauteur) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur = hauteur;
    tex = loadImage("Textures/boitier.jpg");
    texBlanc=loadImage("Textures/blanc.png");
    boitier = creerBoitier();
  }

  void draw() {
    shape(boitier);
  }
  PShape creerBoitier() {
    float lx = largeur / 2;
    float lz = profondeur / 2;
    float ly = hauteur / 2;

    PShape boitier = createShape(GROUP);
    int gris = color(128, 128, 128);

    // Face supérieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(texBlanc);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, 1, 0);
    faceSuperieure.tint(gris);
    faceSuperieure.noStroke();
    faceSuperieure.vertex(-lx, -ly, -lz, 0, 0);
    faceSuperieure.vertex(lx, -ly, -lz, 1, 0);
    faceSuperieure.vertex(lx, -ly, lz, 1, 1);
    faceSuperieure.vertex(-lx, -ly, lz, 0, 1);
    faceSuperieure.endShape();
    boitier.addChild(faceSuperieure);

    // Face inférieure
    PShape faceInferieure = createShape();
    faceInferieure.beginShape(QUADS);
    faceInferieure.textureMode(NORMAL);
    faceInferieure.texture(texBlanc);
    faceInferieure.shininess(200.0);
    faceInferieure.emissive(0, 0, 0);
    faceInferieure.normal(0, -1, 0);
    faceInferieure.tint(gris);
    faceInferieure.noStroke();
    faceInferieure.vertex(-lx, ly, -lz, 0, 0);
    faceInferieure.vertex(lx, ly, -lz, 1, 0);
    faceInferieure.vertex(lx, ly, lz, 1, 1);
    faceInferieure.vertex(-lx, ly, lz, 0, 1);
    faceInferieure.endShape();
    boitier.addChild(faceInferieure);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(tex);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 0, -1);
    faceAvant.noStroke();
    faceAvant.vertex(-lx, -ly, lz, 0, 0);
    faceAvant.vertex(lx, -ly, lz, 1, 0);
    faceAvant.vertex(lx, ly, lz, 1, 1);
    faceAvant.vertex(-lx, ly, lz, 0, 1);
    faceAvant.endShape();
    boitier.addChild(faceAvant);

    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(texBlanc);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, 1);
    faceArriere.noStroke();
    faceArriere.tint(gris);
    faceArriere.noStroke();
    faceArriere.vertex(-lx, -ly, -lz, 0, 0);
    faceArriere.vertex(lx, -ly, -lz, 1, 0);
    faceArriere.vertex(lx, ly, -lz, 1, 1);
    faceArriere.vertex(-lx, ly, -lz, 0, 1);
    faceArriere.endShape();
    boitier.addChild(faceArriere);

    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(texBlanc);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(-1, 0, 0);
    faceGauche.tint(gris);
    faceGauche.noStroke();
    faceGauche.vertex(-lx, -ly, -lz, 0, 0);
    faceGauche.vertex(-lx, -ly, lz, 1, 0);
    faceGauche.vertex(-lx, ly, lz, 1, 1);
    faceGauche.vertex(-lx, ly, -lz, 0, 1);
    faceGauche.endShape();
    boitier.addChild(faceGauche);

    // Face droite
    PShape faceDroite = createShape();
    faceDroite.beginShape(QUADS);
    faceDroite.textureMode(NORMAL);
    faceDroite.texture(texBlanc);
    faceDroite.shininess(200.0);
    faceDroite.emissive(0, 0, 0);
    faceDroite.normal(-1, 0, 0);
    faceDroite.tint(gris);
    faceDroite.noStroke();
    faceDroite.vertex(lx, -ly, -lz, 0, 0);
    faceDroite.vertex(lx, -ly, lz, 1, 0);
    faceDroite.vertex(lx, ly, lz, 1, 1);
    faceDroite.vertex(lx, ly, -lz, 0, 1);
    faceDroite.endShape();
    boitier.addChild(faceDroite);

    return boitier;
  }
}
