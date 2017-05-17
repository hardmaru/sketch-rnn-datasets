
// A crude and simple sheep viewer. 
// By Aaron Koblin - 2006
//
//
// Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
// http://creativecommons.org/licenses/by-nc/4.0/




String sheepLocation = "sheepTxts/";

boolean skip1=false;

int grey = 0;
String drawData = "";
int curSheep = 1;
int numCommands =0;
int curCommand= 0;
void setup()
{
  frameRate(600); 
  size( 480,255 );
  background(255);
  loadSheep();
  smooth();
}

String[] coords;
ArrayList timing = new ArrayList();
int seconds=0;

void prepData() {
  stroke(0);
  strokeWeight(1);
  coords = drawData.split("_");
  numCommands = coords.length;
}

void keyPressed() {
  if (key == 'a') {
  }
}



void draw()
{

  if(curCommand<numCommands-1) {
    curCommand++;
  }
  else {
    nextSheep();
  }


  int c = curCommand;
  if(coords[c].equals("c")) {

    String[] action = split(coords[c+1],'.');
    if(action[0].equals("lift")) {
    }
    if(action[0].equals("grey")) {
      stroke(int(action[1]));
    }
    if(action[0].equals("stroke")) {
      strokeWeight(int(action[1]));
    }
    skip1 = true;
  }
  else {
    if(!skip1) {
      String[] thisLine = split(coords[c],'.');
      if(thisLine.length == 4) {
        line(float(thisLine[0])-10,float(thisLine[1])-10,float(thisLine[2])-10,float(thisLine[3])-10);
      }
    }
    else {
      skip1=false;
    }
  }
  // saveFrame("Sheep1_"+curCommand+".tga");
}

void nextSheep() {
  println("sheep "+curSheep);
  curCommand = 0;
  if(curSheep < 10000) {
    curSheep ++;
  }
  else {
    curSheep = 0;
  } 
  loadSheep();
  delay(400);
  background(255);
  strokeWeight(1);
  stroke(0);
}

void loadSheep() {
  grey = 0;
  String[] loader = loadStrings(sheepLocation+"sheep"+curSheep);
  drawData = loader[0];
  prepData();
}

