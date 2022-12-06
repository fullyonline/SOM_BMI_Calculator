enum BMICategories {
  //Constants with values
  untergewichtStark("Starkes Untergewicht", double.minPositive, 16),
  untergewichtMaessig("Mässiges Untergewicht", 16, 17),
  untergewichtLeicht("Leichtes Untergewicht", 17,18.5),
  normalgewicht("Normalgewicht", 18.5,25),
  uebergewicht("Übergewicht", 25, 30),
  fettleibigkeitGrad1("Fettleibigkeit Grad 1", 30, 35),
  fettleibigkeitGrad2("Fettleibigkeit Grad 2", 35, 40),
  fettleibigkeitGrad3("Fettleibigkeit Grad 3", 40, double.maxFinite);

  final String text;
  final double lowerLimit;
  final double upperLimit;

  //Constructor to initialize the instance variable
  const BMICategories(this.text, this.lowerLimit, this.upperLimit);
}