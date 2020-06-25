class DNA {
  char[] genes;
  double fitness;
  
  DNA(int targetSize){
    genes = new char[targetSize];
    for (int i=0; i < genes.length; i++){
      genes[i] = (char) random(32,128);
    }
    //print(genes);
  }
  
  String charToString() {
    return new String(genes);
  }
  
  void calcFitness(String target) {
    //Returns a floating point of correct characters
    int correct = 0;
    for (int i = 0; i < genes.length; i++){
      if (genes[i] == target.charAt(i)){
        correct++;
      }
    }
    fitness = (double) correct / (double) target.length(); 
  }
  
  DNA crossover(DNA partner){
    DNA child = new DNA(genes.length);
    
    int midpoint = int(random(genes.length));
    
    for (int i = 0; i < genes.length; i++){
      if (i > midpoint) {
        child.genes[i] = genes[i];
      } else {
        child.genes[i] = partner.genes[i];
      }
    }
    return child;
  }
  
  void mutate(){
    for (int i = 0; i < genes.length; i++){
      if (mutationRate > random(1)){
        genes[i] = (char) random(32,128);
      }
    }
  }
  
}
