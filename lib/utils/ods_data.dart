import 'package:eco_action/models/ods_model.dart';
import 'package:flutter/cupertino.dart';

List<ODSModel> getODSs() {
  List<ODSModel> ODSs = [];
  ODSModel model;

  model = ODSModel();
  model.title = "Fin de la pobreza";
  model.odsNumber = 1;
  model.odsColor = Color.fromRGBO(229, 35, 61, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Hambre cero";
  model.odsNumber = 2;
  model.odsColor = Color.fromRGBO(221, 167, 58, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Salud y bienestar";
  model.odsNumber = 3;
  model.odsColor = Color.fromRGBO(76, 161, 70, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Educación de calidad";
  model.odsNumber = 4;
  model.odsColor = Color.fromRGBO(199, 33, 47, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Igualdad de género";
  model.odsNumber = 5;
  model.odsColor = Color.fromRGBO(238, 64, 45, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Agua limpia y saneamiento";
  model.odsNumber = 6;
  model.odsColor = Color.fromRGBO(40, 191, 230, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Energía asequible y no contaminante";
  model.odsNumber = 7;
  model.odsColor = Color.fromRGBO(251, 196, 18, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Trabajo decente y crecimiento económico";
  model.odsNumber = 8;
  model.odsColor = Color.fromRGBO(163, 29, 68, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Industria, innovación e infraestructura";
  model.odsNumber = 9;
  model.odsColor = Color.fromRGBO(242, 106, 46, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Reducción de las desigualdades";
  model.odsNumber = 10;
  model.odsColor = Color.fromRGBO(223, 26, 131, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Ciudades y comunidades sostenibles";
  model.odsNumber = 11;
  model.odsColor = Color.fromRGBO(248, 157, 42, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Producción y consumo responsables";
  model.odsNumber = 12;
  model.odsColor = Color.fromRGBO(191, 141, 44, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Acción por el clima";
  model.odsNumber = 13;
  model.odsColor = Color.fromRGBO(64, 127, 70, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Vida submarina";
  model.odsNumber = 14;
  model.odsColor = Color.fromRGBO(31, 151, 212, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Vida de ecosistemas terrestres";
  model.odsNumber = 15;
  model.odsColor = Color.fromRGBO(89, 186, 71, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Paz, justicia e instituciones sólidas";
  model.odsNumber = 16;
  model.odsColor = Color.fromRGBO(19, 106, 159, 1);
  ODSs.add(model);

  model = ODSModel();
  model.title = "Alianzas para lograr los objetivos";
  model.odsNumber = 17;
  model.odsColor = Color.fromRGBO(20, 73, 107, 1);
  ODSs.add(model);

  return ODSs;
}
