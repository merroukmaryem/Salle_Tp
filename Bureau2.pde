class Bureau2 {
  PShape bureau;
  Chaise chaise;

  float largeur, profondeur, hauteur, hauteurPieds;
  PImage texBlanc;

  Bureau2(float largeur, float profondeur, float hauteur, float hauteurPieds) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur = hauteur;
    this.hauteurPieds = hauteurPieds;
    chaise = new Chaise(largeur/6, profondeur/3, 10, (hauteur+hauteurPieds)/2, hauteurPieds);
    texBlanc = loadImage("Textures/blanc.png");
    bureau = creerBureau();
  }

  void draw() {
    shape(bureau);
    pushMatrix();
    translate(0, 0, profondeur/2);
    chaise.draw();
    popMatrix();
  }

  PShape creerBureau() {
    float lx = largeur / 2;
    float lz = profondeur / 2;
    float ly = hauteur / 2;

    PShape bureau = createShape(GROUP);
    int gris = color(230, 230, 230);

    // Face supérieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(texBlanc);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, 1, 0);
    faceSuperieure.tint(gris);
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
    faceArriere.texture(texBlanc);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, 1);
    faceArriere.tint(gris);
    faceArriere.vertex(-lx, -ly, -lz, 0, 0);
    faceArriere.vertex(lx, -ly, -lz, 1, 0);
    faceArriere.vertex(lx, ly/2, -lz, 1, 1);
    faceArriere.vertex(-lx, ly/2, -lz, 0, 1);
    faceArriere.endShape();
    bureau.addChild(faceArriere);

    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(texBlanc);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(-1, 0, 0);
    faceGauche.tint(gris);
    faceGauche.vertex(-lx, -ly, -lz, 0, 0);
    faceGauche.vertex(-lx, -ly, lz, 1, 0);
    faceGauche.vertex(-lx, ly/2, lz, 1, 1);
    faceGauche.vertex(-lx, ly/2, -lz, 0, 1);
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
    faceDroite.tint(gris);
    faceDroite.vertex(lx, -ly, -lz, 0, 0);
    faceDroite.vertex(lx, -ly, lz, 1, 0);
    faceDroite.vertex(lx, ly/2, lz, 1, 1);
    faceDroite.vertex(lx, ly/2, -lz, 0, 1);
    faceDroite.endShape();
    bureau.addChild(faceDroite);

    // Pieds
    float piedLargeur = largeur * 0.05;
    float piedProfondeur = profondeur * 0.05;
    bureau.addChild(creerPied(-lx + piedLargeur / 2, piedLargeur, piedProfondeur, -lz + piedProfondeur / 2, hauteurPieds));
    bureau.addChild(creerPied(lx - piedLargeur / 2, piedLargeur, piedProfondeur, -lz + piedProfondeur / 2, hauteurPieds));
    bureau.addChild(creerPied(-lx + piedLargeur / 2, piedLargeur, piedProfondeur, lz - piedProfondeur / 2, hauteurPieds));
    bureau.addChild(creerPied(lx - piedLargeur / 2, piedLargeur, piedProfondeur, lz - piedProfondeur / 2, hauteurPieds));

    return bureau;
  }
  PShape creerPied(float x, float largeur, float profondeur, float z, float y) {
    PShape pied = createShape();
    int noir = color(0, 0, 0);
    pied.beginShape(QUADS);
    pied.textureMode(NORMAL);
    pied.texture(texBlanc);
    pied.shininess(200.0);
    pied.emissive(0, 0, 0);
    pied.normal(0, 0, 1);
    pied.noStroke();
    pied.tint(noir);


    float lx = largeur / 4;
    float lz = profondeur / 4;

    // Faces du pied
    pied.vertex(x - lx, y, z - lz, 0, 0);
    pied.vertex(x + lx, y, z - lz, 1, 0);
    pied.vertex(x + lx, y - hauteurPieds, z - lz, 1, 1);
    pied.vertex(x - lx, y - hauteurPieds, z - lz, 1, 0);

    pied.vertex(x - lx, y, z + lz, 0, 0);
    pied.vertex(x + lx, y, z + lz, 1, 0);
    pied.vertex(x + lx, y - hauteurPieds, z + lz, 1, 1);
    pied.vertex(x - lx, y - hauteurPieds, z + lz, 1, 0);

    pied.vertex(x - lx, y, z - lz, 0, 0);
    pied.vertex(x - lx, y, z + lz, 1, 0);
    pied.vertex(x - lx, y - hauteurPieds, z + lz, 1, 1);
    pied.vertex(x - lx, y - hauteurPieds, z - lz, 1, 0);

    pied.vertex(x + lx, y, z - lz, 0, 0);
    pied.vertex(x + lx, y, z + lz, 1, 0);
    pied.vertex(x + lx, y - hauteurPieds, z + lz, 1, 1);
    pied.vertex(x + lx, y - hauteurPieds, z - lz, 1, 0);

    pied.endShape();
    return pied;
  }
}
