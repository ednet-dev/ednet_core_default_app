 
// test/ednet_core/default_app/ednet_core_default_app_gen.dart 
import "package:ednet_core/ednet_core.dart"; 
import "package:ednet_core_default_app/ednet_core_default_app.dart"; 
 
void genCode(CoreRepository repository) { 
  repository.gen("ednet_core_default_app"); 
} 
 
void initData(CoreRepository repository) { 
   var ednet_coreDomain = repository.getDomainModels("Ednet_core"); 
   Default_appModel? default_appModel = ednet_coreDomain?.getModelEntries("Default_app") as Default_appModel?; 
   default_appModel?.init(); 
   //default_appModel.display(); 
} 
 
void main() { 
  var repository = CoreRepository(); 
  genCode(repository); 
  //initData(repository); 
} 
 
