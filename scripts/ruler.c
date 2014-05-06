// To compile and run: gcc ruler.c -lglut -lGL;./a.out
#include <math.h>
#include <GL/glut.h>
#include <GL/gl.h>

// Setup vars
int rulerH=200;
int rulerW=50;
int mouseX=0;
int mouseY=0;

//Initialize OpenGL 
void init(void) {
  glClearColor(0, 0, 0, 0);
  glViewport(0, 0, rulerW, rulerH);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glOrtho(0, 50, 0, 200, 1, -1);
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
} 
void drawLines(void) {
  glClear(GL_COLOR_BUFFER_BIT);  
  glColor3f(0.0,0.4,0.2); 
  glPointSize(3.0);  
  glBegin(GL_LINES);
  glVertex2d(2, y);
  glVertex2d(x, rulerH-5);
  glVertex2d(rulerW-5, rulerH-5);
  glVertex2d(rulerW-5, 0);
  glVertex2d(2, 0);
  glEnd();
  glFlush();
} 
void myMouseMove(int x, int y){
  mouseX = x;
  mouseY = y;
}
int main(int argc, char**argv) {
  glutInit(&argc, argv);  
  glutInitWindowPosition(10,10); 
  glutInitWindowSize(500,500); 
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB); 
  glutCreateWindow("Example"); 
  init(); 
  glutPassiveMotionFunc( myMouseMove);
  glutDisplayFunc(drawLines); 
  glutMainLoop();
}
