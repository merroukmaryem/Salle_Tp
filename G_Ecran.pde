class G_Ecran {
  PShape ecran;
  PImage tex, texBlanc;

  float largeur, profondeur, hauteur, largeurSupport, profondeurSupport, hauteurSupport;

  G_Ecran(float largeur, float profondeur, float hauteur, float largeurSupport, float profondeurSupport, float hauteurSupport) {
    this.largeur = largeur;
    this.profondeur = profondeur;
    this.hauteur = hauteur;
    this.largeurSupport = largeurSupport;
    this.hauteurSupport = hauteurSupport;
    this.profondeurSupport = profondeurSupport;
    tex = loadImage("Textures/G_ecran.png");
    texBlanc = loadImage("Textures/blanc.png");
    ecran = creerG_Ecran();
  }
  void draw() {
    shape(ecran);
  }

  PShape creerG_Ecran() {
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
    faceAvant.normal(0, 0, -1);
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
    faceArriere.normal(0, 0, 1);
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
    //Support
    PShape support = support();
    support.translate(0, hauteur / 2 + hauteurSupport / 2, 0); // Descendre le support sous l'écran
    ecran.addChild(support);
    return ecran;
  }
  PShape support() {
    float lx = largeurSupport / 2;
    float lz = profondeurSupport / 2;
    float ly = hauteurSupport / 2;

    int noir = color(0, 0, 0);

    PShape support = createShape(GROUP);

    // Base du support
    PShape base = createShape();
    base.beginShape(QUADS);
    base.textureMode(NORMAL);
    base.texture(texBlanc);
    base.shininess(200.0);
    base.emissive(0, 0, 0);
    base.normal(0, 0, 1);
    base.noStroke();
    base.tint(noir);
    base.vertex(-lx, ly, -lz, 0, 0);
    base.vertex(lx, ly, -lz, 1, 0);
    base.vertex(lx, ly, lz, 1, 1);
    base.vertex(-lx, ly, lz, 0, 1);
    base.endShape();
    support.addChild(base);

    PShape pied = createShape();
    pied.beginShape(QUADS);
    pied.textureMode(NORMAL);
    pied.texture(texBlanc);
    pied.shininess(200.0);
    pied.emissive(0, 0, 0);
    pied.normal(0, 0, 1);
    pied.noStroke();
    pied.tint(noir);
    pied.vertex(-lx / 2, ly, -lz / 2, 0, 0);
    pied.vertex(lx / 2, ly, -lz / 2, 1, 0);
    pied.vertex(lx / 2, -ly, -lz / 2, 1, 1);
    pied.vertex(-lx / 2, -ly, -lz / 2, 0, 1);
    pied.endShape();
    support.addChild(pied);

    return support;
  }
}
