part of ednet_core_default_app; 
 
// lib/gen/ednet_core/default_app/model_entries.dart 
 
class Default_appEntries extends ModelEntries { 
 
  Default_appEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Project"); 
    entries["Project"] = Projects(concept!); 
    return entries; 
  } 
 
  Entities? newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Project") { 
      return Projects(concept!); 
    } 
    return null; 
  } 
 
  Entity? newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Project") { 
      return Project(concept!); 
    } 
    return null; 
  } 
 
  Projects get projects => getEntry("Project") as Projects; 
 
} 
 
