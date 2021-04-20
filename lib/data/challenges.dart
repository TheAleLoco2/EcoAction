import 'package:eco_action/models/challenge_model.dart';

List<ChallengeModel> getChallenges() {
  List<ChallengeModel> challenges = [];
  ChallengeModel model;

  model = ChallengeModel();
  model.title = "Recoge una botella";
  model.challenge =
      "Cuando salgas por la calle y veas una botella de plástico tirada, recógela y llévala al bote de basura más cercano.";
  model.credits = 5;
  model.odsNumber = [12, 15];
  model.completedMsg =
      "¡Enhorabuena! Estás contribuyendo al correcto manejo de residuos y ayudando a la vida de los ecosistemas terrestres.";
  challenges.add(model);

  model = ChallengeModel();
  model.title = "Bánate con cubeta";
  model.challenge =
      "Hoy toma una ducha con una sola cubeta de agua, para no desperdiciar más agua de la necesaria.";
  model.credits = 8;
  model.odsNumber = [6, 13];
  model.completedMsg =
      "De acuerdo con la OMS una ducha de 10 minutos consume 200 litros de agua, por lo que hoy ahorraste al menos 180 litros.";
  challenges.add(model);

  model = ChallengeModel();
  model.title = "Recoge una botella";
  model.challenge =
      "Cuando salgas por la calle y veas una botella de plástico tirada, recógela y llévala al bote de basura más cercano.";
  model.credits = 5;
  model.odsNumber = [12, 15];
  model.completedMsg =
      "¡Enhorabuena! Estás contribuyendo al correcto manejo de residuos y ayudando a la vida de los ecosistemas terrestres.";
  challenges.add(model);

  model = ChallengeModel();
  model.title = "Bánate con cubeta";
  model.challenge =
      "Hoy toma una ducha con una sola cubeta de agua, para no desperdiciar más agua de la necesaria.";
  model.credits = 8;
  model.odsNumber = [6, 13];
  model.completedMsg =
      "De acuerdo con la OMS una ducha de 10 minutos consume 200 litros de agua, por lo que hoy ahorraste al menos 180 litros.";
  challenges.add(model);

  return challenges;
}
