class Chaise {
  PShape chaise;
  PImage tex, texBlanc;
  PShape dossier, assise;
  float largeur, profondeur, hauteur1, hauteur2, hauteurPieds;

  Chaise(float largeur, float profondeur, float hauteur1, float hauteur2, float hauteurPieds) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur1 = hauteur1;
    this.hauteur2 = hauteur2;
    this.hauteurPieds = hauteurPieds;
    tex = loadImage("Textures/bureau.jpg");
    texBlanc = loadImage("Textures/blanc.png");
    chaise = creerChaise();
  }

  void draw() {
    shape(chaise);
  }

  PShape creerChaise() {
    float lx = largeur / 2;
    float lz = profondeur / 2;
    float epaisseurAssise = 5;
    float epaisseurDossier = 5;
    //int bois= color(230, 150, 50);
    PShape chaise = createShape(GROUP);

    // Assise
    assise = createShape();
    assise.beginShape(QUADS);
    assise.textureMode(NORMAL);
    assise.texture(tex);
    assise.shininess(200.0);
    assise.emissive(0, 0, 0);
    assise.normal(0, 1, 0);
    assise.noStroke();

    // Dessus
    assise.vertex(-lx, 0, -lz, 0, 0);
    assise.vertex(lx, 0, -lz, 1, 0);
    assise.vertex(lx, 0, lz, 1, 1);
    assise.vertex(-lx, 0, lz, 0, 1);

    // Dessous
    assise.vertex(-lx, -epaisseurAssise, -lz, 0, 0);
    assise.vertex(lx, -epaisseurAssise, -lz, 1, 0);
    assise.vertex(lx, -epaisseurAssise, lz, 1, 1);
    assise.vertex(-lx, -epaisseurAssise, lz, 0, 1);

    // Devant
    assise.vertex(-lx, 0, -lz, 0, 0);
    assise.vertex(lx, 0, -lz, 1, 0);
    assise.vertex(lx, -epaisseurAssise, -lz, 1, 1);
    assise.vertex(-lx, -epaisseurAssise, -lz, 0, 1);

    // Arrière
    assise.vertex(-lx, 0, lz, 0, 0);
    assise.vertex(lx, 0, lz, 1, 0);
    assise.vertex(lx, -epaisseurAssise, lz, 1, 1);
    assise.vertex(-lx, -epaisseurAssise, lz, 0, 1);

    // Côtés
    assise.vertex(-lx, 0, -lz, 0, 0);
    assise.vertex(-lx, 0, lz, 1, 0);
    assise.vertex(-lx, -epaisseurAssise, lz, 1, 1);
    assise.vertex(-lx, -epaisseurAssise, -lz, 0, 1);

    assise.vertex(lx, 0, -lz, 0, 0);
    assise.vertex(lx, 0, lz, 1, 0);
    assise.vertex(lx, -epaisseurAssise, lz, 1, 1);
    assise.vertex(lx, -epaisseurAssise, -lz, 0, 1);

    assise.endShape();
    chaise.addChild(assise);

    // Dossier
    dossier = createShape();
    dossier.beginShape(QUADS);
    dossier.textureMode(NORMAL);
    dossier.texture(tex);
    dossier.shininess(200.0);
    dossier.emissive(0, 0, 0);
    dossier.normal(0, 1, 0);
    dossier.noStroke();

    float posY = -epaisseurAssise; // Aligné avec l'assise

    // Face avant
    dossier.vertex(-lx, posY, lz, 0, 0);
    dossier.vertex(lx, posY, lz, 1, 0);
    dossier.vertex(lx, posY - hauteur2, lz, 1, 1);
    dossier.vertex(-lx, posY - hauteur2, lz, 0, 1);

    // Face arrière
    dossier.vertex(-lx, posY, lz + epaisseurDossier, 0, 0);
    dossier.vertex(lx, posY, lz + epaisseurDossier, 1, 0);
    dossier.vertex(lx, posY - hauteur2, lz + epaisseurDossier, 1, 1);
    dossier.vertex(-lx, posY - hauteur2, lz + epaisseurDossier, 0, 1);

    // Côtés
    dossier.vertex(-lx, posY, lz, 0, 0);
    dossier.vertex(-lx, posY, lz + epaisseurDossier, 1, 0);
    dossier.vertex(-lx, posY - hauteur2, lz + epaisseurDossier, 1, 1);
    dossier.vertex(-lx, posY - hauteur2, lz, 0, 1);

    dossier.vertex(lx, posY, lz, 0, 0);
    dossier.vertex(lx, posY, lz + epaisseurDossier, 1, 0);
    dossier.vertex(lx, posY - hauteur2, lz + epaisseurDossier, 1, 1);
    dossier.vertex(lx, posY - hauteur2, lz, 0, 1);

    // Haut
    dossier.vertex(-lx, posY - hauteur2, lz, 0, 0);
    dossier.vertex(lx, posY - hauteur2, lz, 1, 0);
    dossier.vertex(lx, posY - hauteur2, lz + epaisseurDossier, 1, 1);
    dossier.vertex(-lx, posY - hauteur2, lz + epaisseurDossier, 0, 1);

    // Bas (collé à l'assise)
    dossier.vertex(-lx, posY, lz, 0, 0);
    dossier.vertex(lx, posY, lz, 1, 0);
    dossier.vertex(lx, posY, lz + epaisseurDossier, 1, 1);
    dossier.vertex(-lx, posY, lz + epaisseurDossier, 0, 1);

    dossier.endShape();
    chaise.addChild(dossier);

    // Pieds
    float piedLargeur = largeur * 0.1;
    float piedProfondeur = profondeur * 0.1;
    chaise.addChild(creerPied(-lx + piedLargeur / 2, piedLargeur, piedProfondeur, -lz + piedProfondeur / 2, hauteurPieds));
    chaise.addChild(creerPied(lx - piedLargeur / 2, piedLargeur, piedProfondeur, -lz + piedProfondeur / 2, hauteurPieds));
    chaise.addChild(creerPied(-lx + piedLargeur / 2, piedLargeur, piedProfondeur, lz - piedProfondeur / 2, hauteurPieds));
    chaise.addChild(creerPied(lx - piedLargeur / 2, piedLargeur, piedProfondeur, lz - piedProfondeur / 2, hauteurPieds));

    return chaise;
  }

  PShape creerPied(float x, float largeur, float profondeur, float z, float y) {
    int jaune = color(255, 255, 0);
    PShape pied = createShape();

    pied.beginShape(QUADS);
    pied.textureMode(NORMAL);
    pied.texture(texBlanc);
    pied.shininess(200.0);
    pied.emissive(0, 0, 0);
    pied.noStroke();
    pied.tint(jaune);

    float lx = largeur / 2;
    float lz = profondeur / 2;

    // Faces du pied
    pied.normal(0, 0, -1);
    pied.vertex(x - lx, y, z - lz, 0, 0);
    pied.vertex(x + lx, y, z - lz, 1, 0);
    pied.vertex(x + lx, y - hauteurPieds, z - lz, 1, 1);
    pied.vertex(x - lx, y - hauteurPieds, z - lz, 0, 1);

    pied.normal(0, 0, 1);
    pied.vertex(x - lx, y, z + lz, 0, 0);
    pied.vertex(x + lx, y, z + lz, 1, 0);
    pied.vertex(x + lx, y - hauteurPieds, z + lz, 1, 1);
    pied.vertex(x - lx, y - hauteurPieds, z + lz, 0, 1);

    pied.normal(-1, 0, 0);
    pied.vertex(x - lx, y, z - lz, 0, 0);
    pied.vertex(x - lx, y, z + lz, 1, 0);
    pied.vertex(x - lx, y - hauteurPieds, z + lz, 1, 1);
    pied.vertex(x - lx, y - hauteurPieds, z - lz, 0, 1);

    pied.normal(1, 0, 0);
    pied.vertex(x + lx, y, z - lz, 0, 0);
    pied.vertex(x + lx, y, z + lz, 1, 0);
    pied.vertex(x + lx, y - hauteurPieds, z + lz, 1, 1);
    pied.vertex(x + lx, y - hauteurPieds, z - lz, 0, 1);

    pied.endShape();
    return pied;
  }
}
