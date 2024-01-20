// Implement a bubble sort algorithm that works on an ArrayList of objects
ArrayList<Circle> bubbleSort(ArrayList<Circle> list) {
  // Get the size of the list
  int n = list.size();
  // Loop through the list
  for (int i = 0; i < n - 1; i++) {
    // Loop through the list again, starting from the end
    for (int j = n - 1; j > i; j--) {
      // Get the current and previous Circle objects
      Circle current = list.get(j);
      Circle previous = list.get(j - 1);
      // Compare their amp attributes
      if (abs(current.getAmp()) > abs(previous.getAmp())) {
        // Swap them in the list
        list.set(j, previous);
        list.set(j - 1, current);
      }
    }
  }
  return list;
}
