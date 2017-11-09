class Fish extends SeaLife
{
  Fish()
  {
    super();
    seaLifeImage = loadImage("Images/FishImage.png");
    seaLifeTint = color(color(random(100, 255), random(100, 255), random(100, 255)));
    
    seaLifeWidthSize = seaLifeImage.width / 20 * seaLifeSize;
    seaLifeHeightSize = seaLifeImage.height / 20 * seaLifeSize;
    seaLifeXSpeed = random(-5, 5);
    seaLifeYSpeed = random(-.5, .5);
    seaLifeFloatRate = random(.05, .1);
    seaLifeColor = color(random(255), random(255), random(255));
  }
  
  void drawFish()
  {
    fishSpecificEdgeCheck();
    super.generalControl();
    
    
    // maybe add this to SeaLife?
    pushMatrix();
    
      tint(seaLifeTint);
      translate(seaLifeXPos, seaLifeYPos + (sin(seaLifeFloatNumber) * 8));
      super.checkSeaLifeDirection();
      image(seaLifeImage, 0, 0, seaLifeWidthSize, seaLifeHeightSize);
    
    popMatrix();
  }
  
  // This is needed because the fish float up and down at a specific multiplier of sin(seaLifeFloatNumber), which is currently 8x
  void fishSpecificEdgeCheck()
  {
    if (seaLifeYPos - (seaLifeHeightSize / 2) + (sin(seaLifeFloatNumber) * 8) <= 0)
    {
      seaLifeYPos = 0 + (seaLifeHeightSize / 2) - (sin(seaLifeFloatNumber) * 8);
      seaLifeYSpeed = seaLifeYSpeed * -1;
    }
    
    if (seaLifeYPos + (seaLifeHeightSize / 2) + (sin(seaLifeFloatNumber) * 8) >= height - aquariumBottomSize)
    {
      seaLifeYPos = height - (seaLifeHeightSize / 2) - (sin(seaLifeFloatNumber) * 8) - aquariumBottomSize;
      seaLifeYSpeed = seaLifeYSpeed * -1;
    }
  }
}