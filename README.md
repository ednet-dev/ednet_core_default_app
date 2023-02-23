[EDNetCore](https://github.com/ednet-dev/ednet_core) is a domain model framework.
Its open source license is the 3-clause BSD license --
["New BSD License" or "Modified BSD License"](http://en.wikipedia.org/wiki/BSD_license).

EDNetCore model consists of concepts, concept attributes and concept neighbors.
Two neighbors make a relationship between two concepts. A relationship has two
directions, each direction going from one concept to another neighbor concept.
Standard one-to-many and many-to-many relationships are supported. When both
concepts are the same, the relationship is reflexive. When there are two
relationships between the same but different concepts, the relationships are
twins.

A graphical model designed in
[Model Concepts](https://github.com/dzenanr/magic_boxes) is transformed into
[json](http://www.json.org/) representation that is imported to
[EDNetCoreGen](https://github.com/ednet-dev/ednet_core_gen).
In ednet_core_gen, the json document is used to generate code for the model and
its context project.

ednet core default app is used to interpret a EDNetCore model and navigate
through the model, starting by entry points.

## More Details

[**ednet_core: Domain Model Framework**](https://docs.google.com/document/d/1xzjqxbJdYxn6Qpx_kIhCqCCjk5yabbXiOng8sixMjdc/edit?usp=sharing)

[*Learning Dart*](http://www.packtpub.com/learning-dart/book) by Dzenan Ridjanovic & Ivo Balbaert

[*On Dart*](http://ondart.me/)

[*Version History*](CHANGELOG.md)


