part of ednet_core_default_app;

// lib/gen/ednet_core/default_app/projects.dart

abstract class ProjectGen extends Entity<Project> {

  ProjectGen(Concept concept) {
    this.concept = concept;
  }

  String get name => getAttribute("name");
  void set name(String a) { setAttribute("name", a); }

  String get description => getAttribute("description");
  void set description(String a) { setAttribute("description", a); }

  Project newEntity() => Project(concept);
  Projects newEntities() => Projects(concept);

}

abstract class ProjectsGen extends Entities<Project> {

  ProjectsGen(Concept concept) {
    this.concept = concept;
  }

  Projects newEntities() => Projects(concept!);
  Project newEntity() => Project(concept!);

}

