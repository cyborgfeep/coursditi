class Feature{
  String? title;
  String? desc;
  String? img;

  Feature(this.title, this.desc, this.img);

  static List<Feature> featureList=[
    Feature("Acheter", "Crédit, pass", "assets/images/buy.jpg"),
    Feature("Transférer", "Argent, crédit", "assets/images/transfer.jpg"),
    Feature("Payer", "Ma facture", "assets/images/pay.jpg"),
    Feature("Gérer", "Fibre, Adsl, Box", "assets/images/manage.jpg"),
    Feature("Demander", "Un SOS", "assets/images/sos.jpg"),
    Feature("Se Divertir", "", "assets/images/manage.jpg"),
  ];
}

