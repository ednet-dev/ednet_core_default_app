 
part of ednet_core_default_app; 
 
// lib/ednet_core/default_app/model.dart 
 
class Default_appModel extends Default_appEntries { 
 
  Default_appModel(Model model) : super(model); 
 
  void fromJsonToProjectEntry() { 
    fromJsonToEntry(ednet_coreDefault_appProjectEntry); 
  } 
 
  void fromJsonToModel() { 
    fromJson(ednet_coreDefault_appModel); 
  } 
 
  void init() { 
    initProjects(); 
  } 
 
  void initProjects() { 
    var project1 = Project(projects.concept!); 
    project1.name = 'video'; 
    project1.description = 'secretary'; 
    projects.add(project1); 
 
    var project2 = Project(projects.concept!); 
    project2.name = 'feeling'; 
    project2.description = 'time'; 
    projects.add(project2); 
 
    var project3 = Project(projects.concept!); 
    project3.name = 'chairman'; 
    project3.description = 'cabinet'; 
    projects.add(project3); 
 
  } 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
