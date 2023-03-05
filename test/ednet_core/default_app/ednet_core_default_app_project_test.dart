 
// test/ednet_core/default_app/ednet_core_default_app_project_test.dart 
 
import "package:test/test.dart"; 
import "package:ednet_core/ednet_core.dart"; 
import "package:ednet_core_default_app/ednet_core_default_app.dart"; 
 
void testEdnet_coreDefault_appProjects( 
    Ednet_coreDomain ednet_coreDomain, Default_appModel default_appModel, Projects projects) { 
  DomainSession session; 
  group("Testing Ednet_core.Default_app.Project", () { 
    session = ednet_coreDomain.newSession();  
    setUp(() { 
      default_appModel.init(); 
    }); 
    tearDown(() { 
      default_appModel.clear(); 
    }); 
 
    test("Not empty model", () { 
      expect(default_appModel.isEmpty, isFalse); 
      expect(projects.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      default_appModel.clear(); 
      expect(default_appModel.isEmpty, isTrue); 
      expect(projects.isEmpty, isTrue); 
      expect(projects.exceptions.isEmpty, isTrue); 
    }); 
 
    test("From model to JSON", () { 
      var json = default_appModel.toJson(); 
      expect(json, isNotNull); 
 
      print(json); 
      //default_appModel.displayJson(); 
      //default_appModel.display(); 
    }); 
 
    test("From JSON to model", () { 
      var json = default_appModel.toJson(); 
      default_appModel.clear(); 
      expect(default_appModel.isEmpty, isTrue); 
      default_appModel.fromJson(json); 
      expect(default_appModel.isEmpty, isFalse); 
 
      default_appModel.display(); 
    }); 
 
    test("From model entry to JSON", () { 
      var json = default_appModel.fromEntryToJson("Project"); 
      expect(json, isNotNull); 
 
      print(json); 
      //default_appModel.displayEntryJson("Project"); 
      //default_appModel.displayJson(); 
      //default_appModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = default_appModel.fromEntryToJson("Project"); 
      projects.clear(); 
      expect(projects.isEmpty, isTrue); 
      default_appModel.fromJsonToEntry(json); 
      expect(projects.isEmpty, isFalse); 
 
      projects.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add project required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add project unique error", () { 
      var projectConcept = projects.concept!; 
      var projectCount = projects.length; 
      var project = Project(projectConcept);
      var randomProject = projects.random(); 
      project.name = randomProject.name; 
      var added = projects.add(project); 
      expect(added, isFalse); 
      expect(projects.length, equals(projectCount)); 
      expect(projects.exceptions.length, greaterThan(0)); 
 
      projects.exceptions.display(title: "Add project unique error"); 
    }); 
 
    test("Not found project by oid", () { 
      var ednetOid = Oid.ts(1345648254063); 
      var project = projects.singleWhereOid(ednetOid); 
      expect(project, isNull); 
    }); 
 
    test("Find project by oid", () { 
      var randomProject = projects.random(); 
      var project = projects.singleWhereOid(randomProject.oid); 
      expect(project, isNotNull); 
      expect(project, equals(randomProject)); 
    }); 
 
    test("Find project by attribute id", () { 
      var randomProject = projects.random(); 
      var project = 
          projects.singleWhereAttributeId("name", randomProject.name); 
      expect(project, isNotNull); 
      expect(project!.name, equals(randomProject.name)); 
    }); 
 
    test("Find project by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find project by attribute", () { 
      var randomProject = projects.random(); 
      var project = 
          projects.firstWhereAttribute("description", randomProject.description); 
      expect(project, isNotNull); 
      expect(project.description, equals(randomProject.description)); 
    }); 
 
    test("Select projects by attribute", () { 
      var randomProject = projects.random(); 
      var selectedProjects = 
          projects.selectWhereAttribute("description", randomProject.description); 
      expect(selectedProjects.isEmpty, isFalse); 
      selectedProjects.forEach((se) => 
          expect(se.description, equals(randomProject.description))); 
 
      //selectedProjects.display(title: "Select projects by description"); 
    }); 
 
    test("Select projects by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select projects by attribute, then add", () { 
      var randomProject = projects.random(); 
      var selectedProjects = 
          projects.selectWhereAttribute("description", randomProject.description); 
      expect(selectedProjects.isEmpty, isFalse); 
      expect(selectedProjects.source?.isEmpty, isFalse); 
      var projectsCount = projects.length; 
 
      var project = Project(projects.concept!); 
      project.name = 'life'; 
      project.description = 'energy'; 
      var added = selectedProjects.add(project); 
      expect(added, isTrue); 
      expect(projects.length, equals(++projectsCount)); 
 
      //selectedProjects.display(title: 
      //  "Select projects by attribute, then add"); 
      //projects.display(title: "All projects"); 
    }); 
 
    test("Select projects by attribute, then remove", () { 
      var randomProject = projects.random(); 
      var selectedProjects = 
          projects.selectWhereAttribute("description", randomProject.description); 
      expect(selectedProjects.isEmpty, isFalse); 
      expect(selectedProjects.source?.isEmpty, isFalse); 
      var projectsCount = projects.length; 
 
      var removed = selectedProjects.remove(randomProject); 
      expect(removed, isTrue); 
      expect(projects.length, equals(--projectsCount)); 
 
      randomProject.display(prefix: "removed"); 
      //selectedProjects.display(title: 
      //  "Select projects by attribute, then remove"); 
      //projects.display(title: "All projects"); 
    }); 
 
    test("Sort projects", () { 
      projects.sort(); 
 
      //projects.display(title: "Sort projects"); 
    }); 
 
    test("Order projects", () { 
      var orderedProjects = projects.order(); 
      expect(orderedProjects.isEmpty, isFalse); 
      expect(orderedProjects.length, equals(projects.length)); 
      expect(orderedProjects.source?.isEmpty, isFalse); 
      expect(orderedProjects.source?.length, equals(projects.length)); 
      expect(orderedProjects, isNot(same(projects))); 
 
      //orderedProjects.display(title: "Order projects"); 
    }); 
 
    test("Copy projects", () { 
      var copiedProjects = projects.copy(); 
      expect(copiedProjects.isEmpty, isFalse); 
      expect(copiedProjects.length, equals(projects.length)); 
      expect(copiedProjects, isNot(same(projects))); 
      copiedProjects.forEach((e) => 
        expect(e, equals(projects.singleWhereOid(e.oid)))); 
      copiedProjects.forEach((e) => 
        expect(e, isNot(same(projects.singleWhereId(e.id!))))); 
 
      //copiedProjects.display(title: "Copy projects"); 
    }); 
 
    test("True for every project", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random project", () { 
      var project1 = projects.random(); 
      expect(project1, isNotNull); 
      var project2 = projects.random(); 
      expect(project2, isNotNull); 
 
      //project1.display(prefix: "random1"); 
      //project2.display(prefix: "random2"); 
    }); 
 
    test("Update project id with try", () { 
      var randomProject = projects.random(); 
      var beforeUpdate = randomProject.name; 
      try { 
        randomProject.name = 'bank'; 
      } on UpdateException catch (e) { 
        expect(randomProject.name, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update project id without try", () { 
      var randomProject = projects.random(); 
      var beforeUpdateValue = randomProject.name; 
      expect(() => randomProject.name = 'abstract', throws); 
      expect(randomProject.name, equals(beforeUpdateValue)); 
    }); 
 
    test("Update project id with success", () { 
      var randomProject = projects.random(); 
      var afterUpdateEntity = randomProject.copy(); 
      var attribute = randomProject.concept.attributes.singleWhereCode("name"); 
      expect(attribute?.update, isFalse); 
      attribute?.update = true; 
      afterUpdateEntity.name = 'privacy'; 
      expect(afterUpdateEntity.name, equals('privacy')); 
      attribute?.update = false; 
      var updated = projects.update(randomProject, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = projects.singleWhereAttributeId("name", 'privacy'); 
      expect(entity, isNotNull); 
      expect(entity!.name, equals('privacy')); 
 
      //projects.display("After update project id"); 
    }); 
 
    test("Update project non id attribute with failure", () { 
      var randomProject = projects.random(); 
      var afterUpdateEntity = randomProject.copy(); 
      afterUpdateEntity.description = 'ticket'; 
      expect(afterUpdateEntity.description, equals('ticket')); 
      // projects.update can only be used if oid, code or id is set. 
      expect(() => projects.update(randomProject, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomProject = projects.random(); 
      randomProject.display(prefix:"before copy: "); 
      var randomProjectCopy = randomProject.copy(); 
      randomProjectCopy.display(prefix:"after copy: "); 
      expect(randomProject, equals(randomProjectCopy)); 
      expect(randomProject.oid, equals(randomProjectCopy.oid)); 
      expect(randomProject.code, equals(randomProjectCopy.code)); 
      expect(randomProject.name, equals(randomProjectCopy.name)); 
      expect(randomProject.description, equals(randomProjectCopy.description)); 
 
      expect(randomProject.id, isNotNull); 
      expect(randomProjectCopy.id, isNotNull); 
      expect(randomProject.id, equals(randomProjectCopy.id)); 
 
      var idsEqual = false; 
      if (randomProject.id == randomProjectCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomProject.id!.equals(randomProjectCopy.id!)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("project action undo and redo", () { 
      var projectCount = projects.length; 
      var project = Project(projects.concept!); 
        project.name = 'house'; 
      project.description = 'body'; 
      projects.add(project); 
      expect(projects.length, equals(++projectCount)); 
      projects.remove(project); 
      expect(projects.length, equals(--projectCount)); 
 
      var action = AddCommand(session, projects, project); 
      action.doIt(); 
      expect(projects.length, equals(++projectCount)); 
 
      action.undo(); 
      expect(projects.length, equals(--projectCount)); 
 
      action.redo(); 
      expect(projects.length, equals(++projectCount)); 
    }); 
 
    test("project session undo and redo", () { 
      var projectCount = projects.length; 
      var project = Project(projects.concept!); 
        project.name = 'cream'; 
      project.description = 'left'; 
      projects.add(project); 
      expect(projects.length, equals(++projectCount)); 
      projects.remove(project); 
      expect(projects.length, equals(--projectCount)); 
 
      var action = AddCommand(session, projects, project); 
      action.doIt(); 
      expect(projects.length, equals(++projectCount)); 
 
      session.past.undo(); 
      expect(projects.length, equals(--projectCount)); 
 
      session.past.redo(); 
      expect(projects.length, equals(++projectCount)); 
    }); 
 
    test("Project update undo and redo", () { 
      var project = projects.random(); 
      var action = SetAttributeCommand(session, project, "description", 'effort'); 
      action.doIt(); 
 
      session.past.undo(); 
      expect(project.description, equals(action.before)); 
 
      session.past.redo(); 
      expect(project.description, equals(action.after)); 
    }); 
 
    test("Project action with multiple undos and redos", () { 
      var projectCount = projects.length; 
      var project1 = projects.random(); 
 
      var action1 = RemoveCommand(session, projects, project1); 
      action1.doIt(); 
      expect(projects.length, equals(--projectCount)); 
 
      var project2 = projects.random(); 
 
      var action2 = RemoveCommand(session, projects, project2); 
      action2.doIt(); 
      expect(projects.length, equals(--projectCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(projects.length, equals(++projectCount)); 
 
      session.past.undo(); 
      expect(projects.length, equals(++projectCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(projects.length, equals(--projectCount)); 
 
      session.past.redo(); 
      expect(projects.length, equals(--projectCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var projectCount = projects.length; 
      var project1 = projects.random(); 
      var project2 = projects.random(); 
      while (project1 == project2) { 
        project2 = projects.random();  
      } 
      var action1 = RemoveCommand(session, projects, project1); 
      var action2 = RemoveCommand(session, projects, project2); 
 
      var transaction = new Transaction("two removes on projects", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doIt(); 
      projectCount = projectCount - 2; 
      expect(projects.length, equals(projectCount)); 
 
      projects.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      projectCount = projectCount + 2; 
      expect(projects.length, equals(projectCount)); 
 
      projects.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      projectCount = projectCount - 2; 
      expect(projects.length, equals(projectCount)); 
 
      projects.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var projectCount = projects.length; 
      var project1 = projects.random(); 
      var project2 = project1; 
      var action1 = RemoveCommand(session, projects, project1); 
      var action2 = RemoveCommand(session, projects, project2); 
 
      var transaction = Transaction( 
        "two removes on projects, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doIt(); 
      expect(done, isFalse); 
      expect(projects.length, equals(projectCount)); 
 
      //projects.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to project actions", () { 
      var projectCount = projects.length; 
 
      var reaction = ProjectReaction(); 
      expect(reaction, isNotNull); 
 
      ednet_coreDomain.startCommandReaction(reaction); 
      var project = Project(projects.concept!); 
        project.name = 'holiday'; 
      project.description = 'truck'; 
      projects.add(project); 
      expect(projects.length, equals(++projectCount)); 
      projects.remove(project); 
      expect(projects.length, equals(--projectCount)); 
 
      var session = ednet_coreDomain.newSession(); 
      var addCommand = AddCommand(session, projects, project); 
      addCommand.doIt(); 
      expect(projects.length, equals(++projectCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeCommand = SetAttributeCommand( 
        session, project, "description", 'cloud'); 
      setAttributeCommand.doIt(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      ednet_coreDomain.cancelCommandReaction(reaction); 
    }); 
 
  }); 
} 
 
class ProjectReaction implements ICommandReaction { 
  bool reactedOnAdd    = false; 
  bool reactedOnUpdate = false; 
 
  void react(ICommand action) { 
    if (action is IEntitiesCommand) { 
      reactedOnAdd = true; 
    } else if (action is IEntityCommand) { 
      reactedOnUpdate = true; 
    } 
  } 
} 
 
void main() { 
  var repository = Repository(); 
  Ednet_coreDomain ednet_coreDomain = repository.getDomainModels("Ednet_core") as Ednet_coreDomain;   
  assert(ednet_coreDomain != null); 
  Default_appModel default_appModel = ednet_coreDomain.getModelEntries("Default_app") as Default_appModel;  
  assert(default_appModel != null); 
  var projects = default_appModel.projects; 
  testEdnet_coreDefault_appProjects(ednet_coreDomain, default_appModel, projects); 
} 
 
