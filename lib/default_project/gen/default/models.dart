part of default_project;

// data/gen/default/i_domain_models.dart

class DefaultModels extends DomainModels {
  DefaultModels(Domain domain) : super(domain) {
    add(fromJsonToProjectEntries());
  }

  ProjectEntries fromJsonToProjectEntries() {
    final yaml = loadYaml(defaultProjectModelYaml) as YamlMap;
    return new ProjectEntries(fromJsonToModel(
      defaultProjectModelJson,
      domain,
      DefaultRepo.defaultProjectModelCode,
      yaml,
    ));
  }
}
