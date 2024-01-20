import processing.svg.*;
PFont myFont;
PGraphics svg;

void createImage(String text, int fontsize){
    myFont = createFont(fontFile, fontsize);
    // Create a svg graphics object
    svg = createGraphics(width, height);
    beginRecord(svg);
    // Draw with processing commands
    background(0);
    fill(0);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    fill(255);
    text(text, width/2, height/2);
    // Stop recording the svg output
    endRecord();
    // Exit the sketch
    saveFrame("/images/" + text+".png");
}
