class EcranPc {
  PShape ecran;
  PImage tex, texBlanc, texSupport, tex2;

  int noir = color(0, 0, 0);
  int couleur = color(245, 245, 220);

  float largeur, profondeur, hauteur;

  EcranPc(float largeur, float hauteur, float profondeur) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur = hauteur;

    tex = loadImage("Textures/ecran1.png");
    texBlanc = loadImage("Textures/blanc.png");
    texSupport = loadImage("Textures/plaque.jpeg");
    tex2 = loadImage("Textures/bureau.jpg");
    ecran = creerEcran();
  }
  void draw() {
    shape(ecran);
  }



  PShape creerEcran() {
    float lx = largeur / 2;
    float lz = profondeur / 2;
    float ly = hauteur / 2;
    int noir = color(0, 0, 0);

    PShape ecran = createShape(GROUP);

    // Face supérieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(texBlanc);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, 1, 0);
    faceSuperieure.noStroke();
    faceSuperieure.tint(noir);
    faceSuperieure.vertex(-lx, -ly, -lz, 0, 0);
    faceSuperieure.vertex(lx, -ly, -lz, 1, 0);
    faceSuperieure.vertex(lx, -ly, lz, 1, 1);
    faceSuperieure.vertex(-lx, -ly, lz, 0, 1);
    faceSuperieure.endShape();
    ecran.addChild(faceSuperieure);

    // Face inférieure
    PShape faceInferieure = createShape();
    faceInferieure.beginShape(QUADS);
    faceInferieure.textureMode(NORMAL);
    faceInferieure.texture(texBlanc);
    faceInferieure.shininess(200.0);
    faceInferieure.emissive(0, 0, 0);
    faceInferieure.normal(0, -1, 0);
    faceInferieure.noStroke();
    faceInferieure.tint(noir);
    faceInferieure.vertex(-lx, ly, -lz, 0, 0);
    faceInferieure.vertex(lx, ly, -lz, 1, 0);
    faceInferieure.vertex(lx, ly, lz, 1, 1);
    faceInferieure.vertex(-lx, ly, lz, 0, 1);
    faceInferieure.endShape();
    ecran.addChild(faceInferieure);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(tex);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 0, 1);
    faceAvant.noStroke();
    faceAvant.vertex(-lx, -ly, lz, 0, 0);
    faceAvant.vertex(lx, -ly, lz, 1, 0);
    faceAvant.vertex(lx, ly, lz, 1, 1);
    faceAvant.vertex(-lx, ly, lz, 0, 1);
    faceAvant.endShape();
    ecran.addChild(faceAvant);

    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(texBlanc);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, -1);
    faceArriere.noStroke();
    faceArriere.tint(noir);
    faceArriere.vertex(-lx, -ly, -lz, 0, 0);
    faceArriere.vertex(lx, -ly, -lz, 1, 0);
    faceArriere.vertex(lx, ly, -lz, 1, 1);
    faceArriere.vertex(-lx, ly, -lz, 0, 1);
    faceArriere.endShape();
    ecran.addChild(faceArriere);

    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(texBlanc);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(-1, 0, 0);
    faceGauche.noStroke();
    faceGauche.tint(noir);
    faceGauche.vertex(-lx, -ly, -lz, 0, 0);
    faceGauche.vertex(-lx, -ly, lz, 1, 0);
    faceGauche.vertex(-lx, ly, lz, 1, 1);
    faceGauche.vertex(-lx, ly, -lz, 0, 1);
    faceGauche.endShape();
    ecran.addChild(faceGauche);

    // Face droite
    PShape faceDroite = createShape();
    faceDroite.beginShape(QUADS);
    faceDroite.textureMode(NORMAL);
    faceDroite.texture(texBlanc);
    faceDroite.shininess(200.0);
    faceDroite.emissive(0, 0, 0);
    faceDroite.normal(1, 0, 0);
    faceDroite.noStroke();
    faceDroite.tint(noir);
    faceDroite.vertex(lx, -ly, -lz, 0, 0);
    faceDroite.vertex(lx, -ly, lz, 1, 0);
    faceDroite.vertex(lx, ly, lz, 1, 1);
    faceDroite.vertex(lx, ly, -lz, 0, 1);
    faceDroite.endShape();
    ecran.addChild(faceDroite);

    PShape plaque = creerPlaque();
    plaque.translate(0, -ly - 5, 0); //la plaque au-dessus de l'écran
    ecran.addChild(plaque);
    // Partie Noire
    float lx2 = largeur * 1.2 / 2;
    float lz2 = largeur / 6;
    float ly2 = 2.2*hauteur / 2 + 7;
    PShape noire = createShape();
    noire.beginShape(QUADS);
    noire.textureMode(NORMAL);
    noire.texture(texBlanc);
    noire.shininess(200.0);
    noire.emissive(0, 0, 0);
    noire.normal(0, 1, 0);
    noire.noStroke();
    noire.tint(noir);
    noire.vertex(-lx2, ly2, -lz2, 0, 0);
    noire.vertex(lx2, ly2, -lz2, 1, 0);
    noire.vertex(lx2, ly2, lz2, 1, 1);
    noire.vertex(-lx2, ly2, lz2, 0, 1);
    noire.endShape();
    plaque.addChild(noire);

    PShape support = creerSupport();
    ecran.addChild(support);


    return ecran;
  }
  PShape creerPlaque() {
    float plaqueLargeur = largeur * 1.2;
    float plaqueProfondeur = largeur / 3;
    float plaqueEpaisseur = 5;
    float lx = plaqueLargeur / 2;
    float lz = plaqueProfondeur / 2;
    float ly = plaqueEpaisseur / 2;

    PShape plaque = createShape(GROUP);

    // Face Superieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(texSupport);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, 1, 0);
    faceSuperieure.noStroke();
    faceSuperieure.vertex(-lx, -ly, -lz, 0, 0);
    faceSuperieure.vertex(lx, -ly, -lz, 1, 0);
    faceSuperieure.vertex(lx, -ly, lz, 1, 1);
    faceSuperieure.vertex(-lx, -ly, lz, 0, 1);
    faceSuperieure.endShape();
    plaque.addChild(faceSuperieure);

    // Face inférieure
    PShape faceInferieure = createShape();
    faceInferieure.beginShape(QUADS);
    faceInferieure.textureMode(NORMAL);
    faceInferieure.texture(tex2);
    faceInferieure.shininess(200.0);
    faceInferieure.emissive(0, 0, 0);
    faceInferieure.normal(0, -1, 0);
    faceInferieure.noStroke();
    faceInferieure.tint(couleur);
    faceInferieure.vertex(-lx, ly, -lz, 0, 0);
    faceInferieure.vertex(lx, ly, -lz, 1, 0);
    faceInferieure.vertex(lx, ly, lz, 1, 1);
    faceInferieure.vertex(-lx, ly, lz, 0, 1);
    faceInferieure.endShape();
    plaque.addChild(faceInferieure);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(tex2);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 1, 0);
    faceAvant.noStroke();
    faceAvant.tint(couleur);
    faceAvant.vertex(-lx, -ly, lz, 0, 0);
    faceAvant.vertex(lx, -ly, lz, 1, 0);
    faceAvant.vertex(lx, ly, lz, 1, 1);
    faceAvant.vertex(-lx, ly, lz, 0, 1);
    faceAvant.endShape();
    plaque.addChild(faceAvant);

    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(tex2);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 1, 0);
    faceArriere.noStroke();
    faceArriere.tint(couleur);
    faceArriere.vertex(-lx, -ly, -lz, 0, 0);
    faceArriere.vertex(lx, -ly, -lz, 1, 0);
    faceArriere.vertex(lx, ly, -lz, 1, 1);
    faceArriere.vertex(-lx, ly, -lz, 0, 1);
    faceArriere.endShape();
    plaque.addChild(faceArriere);

    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(tex2);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(0, 1, 0);
    faceGauche.noStroke();
    faceGauche.tint(couleur);
    faceGauche.vertex(-lx, -ly, -lz, 0, 0);
    faceGauche.vertex(-lx, -ly, lz, 1, 0);
    faceGauche.vertex(-lx, ly, lz, 1, 1);
    faceGauche.vertex(-lx, ly, -lz, 0, 1);
    faceGauche.endShape();
    plaque.addChild(faceGauche);

    // Face droite
    PShape faceDroite = createShape();
    faceDroite.beginShape(QUADS);
    faceDroite.textureMode(NORMAL);
    faceDroite.texture(tex2);
    faceDroite.shininess(200.0);
    faceDroite.emissive(0, 0, 0);
    faceDroite.normal(0, 1, 0);
    faceDroite.noStroke();
    faceDroite.tint(couleur);
    faceDroite.vertex(lx, -ly, -lz, 0, 0);
    faceDroite.vertex(lx, -ly, lz, 1, 0);
    faceDroite.vertex(lx, ly, lz, 1, 1);
    faceDroite.vertex(lx, ly, -lz, 0, 1);
    faceDroite.endShape();
    plaque.addChild(faceDroite);

    return plaque;
  }
  PShape creerSupport() {
    float supportLargeur = largeur * 0.2;
    float supportProfondeur = 3;
    float supportHauteur = 1.2 * hauteur;
    float slx = supportLargeur / 2;
    float sly = supportHauteur / 2;
    float slz = supportProfondeur / 2;
    float lz = profondeur / 2;

    PShape support = createShape(GROUP);

    // Face supérieure
    PShape faceSuperieure = createShape();
    faceSuperieure.beginShape(QUADS);
    faceSuperieure.textureMode(NORMAL);
    faceSuperieure.texture(texBlanc);
    faceSuperieure.shininess(200.0);
    faceSuperieure.emissive(0, 0, 0);
    faceSuperieure.normal(0, 1, 0);
    faceSuperieure.noStroke();
    faceSuperieure.tint(noir);
    faceSuperieure.vertex(-slx, sly, -lz - slz, 0, 0);
    faceSuperieure.vertex(slx, sly, -lz - slz, 1, 0);
    faceSuperieure.vertex(slx, sly, -lz - slz - supportProfondeur, 1, 1);
    faceSuperieure.vertex(-slx, sly, -lz - slz - supportProfondeur, 0, 1);
    faceSuperieure.endShape();
    support.addChild(faceSuperieure);

    // Face inférieure
    PShape faceInferieure = createShape();
    faceInferieure.beginShape(QUADS);
    faceInferieure.textureMode(NORMAL);
    faceInferieure.texture(texBlanc);
    faceInferieure.shininess(200.0);
    faceInferieure.emissive(0, 0, 0);
    faceInferieure.normal(0, -1, 0);
    faceInferieure.noStroke();
    faceInferieure.tint(noir);
    faceInferieure.vertex(-slx, -sly, -lz - slz, 0, 0);
    faceInferieure.vertex(slx, -sly, -lz - slz, 1, 0);
    faceInferieure.vertex(slx, -sly, -lz - slz - supportProfondeur, 1, 1);
    faceInferieure.vertex(-slx, -sly, -lz - slz - supportProfondeur, 0, 1);
    faceInferieure.endShape();
    support.addChild(faceInferieure);

    // Face avant
    PShape faceAvant = createShape();
    faceAvant.beginShape(QUADS);
    faceAvant.textureMode(NORMAL);
    faceAvant.texture(texBlanc);
    faceAvant.shininess(200.0);
    faceAvant.emissive(0, 0, 0);
    faceAvant.normal(0, 0, 1);
    faceAvant.noStroke();
    faceAvant.tint(noir);
    faceAvant.vertex(-slx, -sly, -lz - slz, 0, 0);
    faceAvant.vertex(slx, -sly, -lz - slz, 1, 0);
    faceAvant.vertex(slx, sly, -lz - slz, 1, 1);
    faceAvant.vertex(-slx, sly, -lz - slz, 0, 1);
    faceAvant.endShape();
    support.addChild(faceAvant);

    // Face arrière
    PShape faceArriere = createShape();
    faceArriere.beginShape(QUADS);
    faceArriere.textureMode(NORMAL);
    faceArriere.texture(texBlanc);
    faceArriere.shininess(200.0);
    faceArriere.emissive(0, 0, 0);
    faceArriere.normal(0, 0, -1);
    faceArriere.noStroke();
    faceArriere.tint(noir);
    faceArriere.vertex(-slx, -sly, -lz - slz - supportProfondeur, 0, 0);
    faceArriere.vertex(slx, -sly, -lz - slz - supportProfondeur, 1, 0);
    faceArriere.vertex(slx, sly, -lz - slz - supportProfondeur, 1, 1);
    faceArriere.vertex(-slx, sly, -lz - slz - supportProfondeur, 0, 1);
    faceArriere.endShape();
    support.addChild(faceArriere);

    // Face gauche
    PShape faceGauche = createShape();
    faceGauche.beginShape(QUADS);
    faceGauche.textureMode(NORMAL);
    faceGauche.texture(texBlanc);
    faceGauche.shininess(200.0);
    faceGauche.emissive(0, 0, 0);
    faceGauche.normal(1, 0, 0);
    faceGauche.noStroke();
    faceGauche.tint(noir);
    faceGauche.vertex(-slx, -sly, -lz - slz, 0, 0);
    faceGauche.vertex(-slx, -sly, -lz - slz - supportProfondeur, 1, 0);
    faceGauche.vertex(-slx, sly, -lz - slz - supportProfondeur, 1, 1);
    faceGauche.vertex(-slx, sly, -lz - slz, 0, 1);
    faceGauche.endShape();
    support.addChild(faceGauche);

    // Face droite
    PShape faceDroite = createShape();
    faceDroite.beginShape(QUADS);
    faceDroite.textureMode(NORMAL);
    faceDroite.texture(texBlanc);
    faceDroite.shininess(200.0);
    faceDroite.emissive(0, 0, 0);
    faceDroite.normal(-1, 0, 0);
    faceDroite.noStroke();
    faceDroite.tint(noir);
    faceDroite.vertex(slx, -sly, -lz - slz, 0, 0);
    faceDroite.vertex(slx, -sly, -lz - slz - supportProfondeur, 1, 0);
    faceDroite.vertex(slx, sly, -lz - slz - supportProfondeur, 1, 1);
    faceDroite.vertex(slx, sly, -lz - slz, 0, 1);
    faceDroite.endShape();
    support.addChild(faceDroite);

    return support;
  }
}
