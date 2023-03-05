part of ednet_core_default_app; 
 
// lib/repository.dart 
 
class Repository extends CoreRepository { 
 
  static const REPOSITORY = "Repository"; 
 
  Repository([String code=REPOSITORY]) : super(code) { 
    var domain = Domain("Ednet_core"); 
    domains.add(domain); 
    add(Ednet_coreDomain(domain)); 
 
  } 
 
} 
 
