ArrayList<PVector> getPoints(String imageName){

    src = loadImage(imageName); 
    opencv = new OpenCV(this, src);

    opencv.gray();
    opencv.threshold(100);
    dst = opencv.getOutput();

    contours = opencv.findContours();
    println("found " + contours.size() + " contours");
    
    ArrayList<PVector> loc = new ArrayList<PVector>();
    for (Contour contour : contours) {
        for (PVector point : contour.getPoints()) {
            loc.add(point);
        }
  }
    return loc;
}
