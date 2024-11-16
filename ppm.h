/* ppm.h : Ddéclare les structures et fonctions nécessaires pour manipuler des images PPM.*/

#ifndef PPM_H
#define PPM_H

struct ppm_pixel {
  unsigned char r;
  unsigned char g;                                /* Représente un pixel avec trois composants de couleur rouge, vert et bleu, chacun étant un octet */
  unsigned char b;
};

static inline void ppm_setpixel(struct ppm_pixel *px, unsigned char r,
                                unsigned char g, unsigned char b) {
  px->r = r;
  px->g = g;                                                      /*fonction qui assigne les valeurs de couleur (rouge, vert, bleu) à un pixel donné*/
  px->b = b;
}

struct ppm_image {
  unsigned int width;
  unsigned int height;                                                     /*Représente une image avec trois champs*/
  struct ppm_pixel *px;
};

int ppm_image_init(struct ppm_image *im, int w, int h);                          /*Représente une image avec trois champs*/
int ppm_image_release(struct ppm_image *im);                  /*Libérer la mémoire allouée pour l'image'*/

static inline void ppm_image_setpixel(struct ppm_image *im, int x, int y,
                                      unsigned char r, unsigned char g,
                                      unsigned char b) {                     /*Place un pixel à une position (x, y) dans l'image avec les couleurs spécifiées*/
  struct ppm_pixel *px = im->px + im->width * y + x;
  ppm_setpixel(px, r, g, b);
}

int ppm_image_dump(struct ppm_image *im, char *path); /*Déclare une fonction pour sauvegarder l'image dans un fichier au format PPM*/

#endif /* PPM_H */
