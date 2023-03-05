 
// web/ednet_core/default_app/ednet_core_default_app_web.dart 
 

import "package:ednet_core/ednet_core.dart"; 
 
import "package:ednet_core_default_app/ednet_core_default_app.dart"; 
import "package:ednet_core_default_app/ednet_core_default_app.dart"; 
 
void initData(CoreRepository repository) { 
   Ednet_coreDomain? ednet_coreDomain = repository.getDomainModels("Ednet_core") as Ednet_coreDomain?; 
   Default_appModel? default_appModel = ednet_coreDomain?.getModelEntries("Default_app") as Default_appModel?; 
   default_appModel?.init(); 
   default_appModel?.display(); 
} 
 
void showData(CoreRepository repository) { 
   // var mainView = View(document, "main"); 
   // mainView.repo = repository; 
   // new RepoMainSection(mainView); 
   print("not implemented"); 
} 
 
void main() { 
  var repository = CoreRepository(); 
  initData(repository); 
  showData(repository); 
} 
 
