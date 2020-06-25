int totalPopulation = 700;
double mutationRate = 0.01;
String target = "Broken Tech Is the Best!";
Boolean foundTarget = false;
String outputString = "";
int successIndex = 0;

DNA[] population;

void setup(){
  size(800,200);
  population = new DNA[totalPopulation];
  
  for (int i=0; i < population.length; i++){
    population[i] = new DNA(target.length());
  }
  
}

void draw(){
  background(255);
  fill(0);
  
  for (int i = 0; i < population.length; i++){
    population[i].calcFitness(target);
  }
  
  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  for (int i=0; i < population.length; i++){
    int timesInPool = int((float) population[i].fitness * 100);
    for (int j=0; j < timesInPool; j++){
      matingPool.add(population[i]);
    }
  }
  
  //Make a new child
  for (int i = 0; i < population.length; i++){
    DNA partnerA = matingPool.get(int(random(matingPool.size())));
    DNA partnerB = matingPool.get(int(random(matingPool.size())));
    
    DNA outputChild = partnerA.crossover(partnerB);
    outputChild.mutate();
    
    population[i] = outputChild;
  }
  
  // Check  
  for (int i = 0; i < population.length; i++){
    if (population[i].charToString().equals(target)){
      successIndex = i;
    }
  }
  
  String overallString = "";
  for (int i =0; i < population.length; i++){
    overallString += population[i].charToString() + " ";
  }
  
  text(overallString, 200, 10,width,height);
  
  outputString = population[successIndex].charToString();
  text(outputString,10,10,width,height);
  
}
