part of ednet_core_default_app;

// lib/gen/ednet_core/i_domain_models.dart

class Ednet_coreModels extends DomainModels {
  Ednet_coreModels(Domain domain) : super(domain) {
    // fromJsonToModel function from ednet_core/lib/domain/model/transfer.json.dart

    Model model = fromJsonToModel(
        ednet_coreDefault_appModelJson, domain, "Default_app", {});
    Default_appModel default_appModel = Default_appModel(model);
    add(default_appModel);
  }
}
