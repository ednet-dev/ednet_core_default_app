part of ednet_core_default_app;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/ednet_core/default_app/json/model.dart

var ednet_coreDefault_appModelJson = r'''
{
  "width": 990,
  "height": 580,
  "relations": [
  ],
  "concepts": [
    {
      "entry": true,
      "name": "Project",
      "x": 179,
      "y": 226,
      "width": 120,
      "height": 120,
      "attributes": [
        {
          "sequence": 10,
          "category": "identifier",
          "name": "name",
          "type": "String",
          "essential": true,
          "sensitive": false,
          "init": ""
        },
        {
          "sequence": 20,
          "category": "attribute",
          "name": "description",
          "type": "String",
          "essential": false,
          "sensitive": false,
          "init": ""
        }
      ]
    }
  ]
}
''';
  