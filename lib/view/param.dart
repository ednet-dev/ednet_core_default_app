part of ednet_core_default_app;

class View {
  Repository? repo;
  Entities? entities;
  Entity? entity;

  Document document;
  String did;
  String? title;
  bool? essentialOnly = true;

  View(this.document, this.did);

  View.from(View otherView, this.did) {
    repo = otherView.repo;
    entities = otherView.entities;
    entity = otherView.entity;

    document = otherView.document;
    title = otherView.title;
    essentialOnly = otherView.essentialOnly;
  }
}
