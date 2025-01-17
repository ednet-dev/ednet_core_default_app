part of ednet_core_default_app;

class EntitiesSimpleTable {
  View view;

  bool hidden = true;

  EntitiesSimpleTable(this.view);

  bool get shown => !hidden;

  void show() {
    if (hidden) {
      String section = '<br/> \n';
      section = '${section}<table> \n';
      section = '${section}  <caption> \n';
      String title;
      if (view.title == null) {
        title = view.did.toUpperCase();
      } else {
        title = view.title ?? '';
      }
      section = '${section}    ${title}';
      section = '${section}  </caption> \n';
      List<Attribute> attributes;
      if (view.essentialOnly ?? false) {
        attributes = view.entities!.concept!.essentialAttributes;
      } else {
        attributes = view.entities!.concept!.attributes.toList();
      }
      String label;
      var value;
      section = '${section}  <tr> \n';
      for (Attribute attribute in attributes.whereType<Attribute>()) {
        label = attribute.codeFirstLetterUpper;
        section = '${section}    <th> \n';
        section = '${section}      ${label} \n';
        section = '${section}    </th> \n';
      }
      section = '${section}  </tr> \n';
      for (var entity in view.entities!) {
        section = '${section}  <tr> \n';
        for (Attribute attribute in attributes.whereType<Attribute>()) {
          value = entity.getAttribute(attribute.code!);
          section = '${section}    <td> \n';
          if (attribute.sensitive) {
            section = '${section}      ******** \n';
          } else if (attribute.type!.code == 'DateTime') {
            if (value != null) {
              // http://api.dartlang.org/docs/releases/latest/intl/DateFormat.html
              //var formatter = new DateFormat.yMd();
              var formatter = new DateFormat('yyyy-MM-dd');
              String formattedValue = formatter.format(value);
              section = '${section}      ${formattedValue} \n';
            } else {
              section = '${section}      ${value} \n';
            }
          } else if (attribute.type!.code == 'Uri') {
            section =
                '${section}      <a href="${value}">${attribute.code}</a> \n';
          } else if (attribute.type!.code == 'Email') {
            section =
                '${section}      <a href="mailto:${value}">${attribute.code}</a> \n';
          } else {
            section = '${section}      ${value} \n';
          }
          section = '${section}    </td> \n';
        }
        section = '${section}  </tr> \n';
      }
      section = '${section}</table> \n';
      section = '$section <br/> \n';

      /*
       * Each web page loaded in the browser has its own document object.
       * This object serves as an entry point to the web page's content
       * (the DOM tree, including elements such as <body> and <table> ) and
       * provides functionality global to the document (such as obtaining the
       * page's URL and creating new elements in the document).
       */
      view.document.querySelector('#${view.did}')?.setInnerHtml(section,
          validator: new NodeValidatorBuilder()
            ..allowHtml5()
            ..allowElement('a', attributes: ['href']));
      hidden = false;
    }
  }

  void hide() {
    if (shown) {
      view.document.querySelector('#${view.did}')?.innerHtml = '';
      hidden = true;
    }
  }
}

class EntitiesTable {
  View view;

  bool hidden = true;

  EntitiesTable(this.view);

  bool get shown => !hidden;

  void show() {
    if (hidden) {
      String section = '<br/> \n';
      section = '${section}<table> \n';
      section = '${section}  <caption> \n';
      String title;
      if (view.title == null) {
        title = view.did.toUpperCase();
      } else {
        title = view.title!;
      }
      section = '${section}    ${title} \n';
      section = '${section}  </caption> \n';
      List<Attribute> attributes;
      if (view.essentialOnly ?? false) {
        attributes = view.entities!.concept!.essentialAttributes;
      } else {
        attributes = view.entities!.concept!.attributes.toList();
      }
      Parents parents = view.entities!.concept!.parents;
      Children children = view.entities!.concept!.children;
      String label;
      var value;
      section = '${section}  <tr> \n';
      for (Attribute attribute in attributes.whereType<Attribute>()) {
        label = attribute.codeFirstLetterUpper;
        section = '${section}    <th> \n';
        section = '${section}      ${label} \n';
        section = '${section}    </th> \n';
      }

      if (view.entities!.concept!.attributes.length > 0) {
        label = 'Display';
        section = '${section}    <th> \n';
        section = '${section}      ${label} \n';
        section = '${section}    </th> \n';
      }

      for (Parent parent in parents.whereType<Parent>()) {
        label = parent.codeFirstLetterUpper;
        section = '${section}    <th> \n';
        section = '${section}      ${label} \n';
        section = '${section}    </th> \n';
      }
      for (Child child in children.whereType<Child>()) {
        label = child.codeFirstLetterUpper;
        section = '${section}    <th> \n';
        section = '${section}      ${label} \n';
        section = '${section}    </th> \n';
      }

      section = '${section}  </tr> \n';

      for (var entity in view.entities!) {
        section = '${section}  <tr> \n';
        for (Attribute attribute in attributes.whereType<Attribute>()) {
          value = entity.getAttribute(attribute.code!);
          section = '${section}    <td> \n';
          if (attribute.sensitive) {
            section = '${section}      ******** \n';
          } else if (attribute.type!.code == 'DateTime') {
            if (value != null) {
              // http://api.dartlang.org/docs/releases/latest/intl/DateFormat.html
              //var formatter = new DateFormat.yMd();
              var formatter = new DateFormat('yyyy-MM-dd');
              String formattedValue = formatter.format(value);
              section = '${section}      ${formattedValue} \n';
            } else {
              section = '${section}      ${value} \n';
            }
          } else if (attribute.type!.code == 'Uri') {
            section =
                '${section}      <a href="${value}">${attribute.code}</a> \n';
          } else if (attribute.type!.code == 'Email') {
            section =
                '${section}      <a href="mailto:${value}">${attribute.code}</a> \n';
          } else {
            section = '${section}      ${value} \n';
          }
          section = '${section}    </td> \n';
        }

        if (entity.concept.attributes.length > 0) {
          section = '${section}    '
              '<td id="${entity.concept.codeFirstLetterLower}${entity.oid}"> \n';
          section = '${section}    </td> \n';
        }

        for (Parent parent in parents.whereType<Parent>()) {
          section = '${section}    <td> \n';
          Parent? parentEntity = entity.getParent(parent.code!) as Parent?;
          if (parentEntity != null) {
            if (parentEntity.identifier) {
              section = '${section}      ${parentEntity.id} \n';
            } else {
              section = '${section}      ${parentEntity.oid} \n';
            }
          }
          section = '${section}    </td> \n';
        }
        for (Child child in children.whereType<Child>()) {
          section = '${section}    <td id="${child.code}Of${entity.oid}"> \n';
          section = '${section}    </td> \n';
        }
        section = '${section}  </tr> \n';
      }
      section = '${section}</table> \n';
      section = '$section <br/> \n';

      /*
       * Each web page loaded in the browser has its own document object.
       * This object serves as an entry point to the web page's content
       * (the DOM tree, including elements such as <body> and <table> ) and
       * provides functionality global to the document (such as obtaining the
       * page's URL and creating new elements in the document).
       */
      view.document.querySelector('#${view.did}')?.setInnerHtml(section,
          validator: new NodeValidatorBuilder()
            ..allowHtml5()
            ..allowElement('a', attributes: ['href']));

      for (var entity in view.entities!) {
        if (entity.concept.attributes.length > 0) {
          Element entityTdElement = view.document.querySelector(
              '#${entity.concept.codeFirstLetterLower}${entity.oid}')!;
          ButtonElement entityButton = new ButtonElement();
          entityButton.text = 'Show';
          var cssClasses = <String>[];
          cssClasses.add('button');
          entityButton.classes = cssClasses;
          String entryConceptThisConceptInternalPath =
              entity.concept.entryConceptThisConceptInternalPath!;
          View entityView =
              new View.from(view, entryConceptThisConceptInternalPath);
          entityView.entity = entity as Entity;
          entityView.title = entity.concept.code;
          entityView.essentialOnly = false;
          EntityTable entityTable = new EntityTable(entityView);

          entityButton.onClick.listen((MouseEvent e) {
            if (entityTable.hidden) {
              entityTable.show();
              entityButton.text = 'Hide';
            } else {
              entityTable.hide();
              entityButton.text = 'Show';
            }
          });

          entityTdElement.children.clear();
          entityTdElement.children.add(entityButton);
        }

        for (Child child in children.whereType<Child>()) {
          Element childTdElement =
              view.document.querySelector('#${child.code}Of${entity.oid}')!;
          ButtonElement childButton = new ButtonElement();
          childButton.text = 'Show';
          var cssClasses = <String>[];
          cssClasses.add('button');
          childButton.classes = cssClasses;

          Concept sourceConcept = child.sourceConcept;
          String? entryConceptSourceConceptInternalPath =
              sourceConcept.entryConceptThisConceptInternalPath;
          Concept destinationConcept = child.destinationConcept;
          String childCodePath =
              '${entryConceptSourceConceptInternalPath}_${child.code}_'
              '${destinationConcept.code}';
          View childView = new View.from(view, childCodePath);
          childView.entities = entity.getChild(child.code) as Entities;
          if (!childView.entities!.isEmpty) {
            if ((entity as Property).identifier) {
              childView.title = '${entity.id}.${child.code}';
            } else {
              childView.title = '${entity}.${child.code}';
            }
            EntitiesTable childTable = new EntitiesTable(childView);

            childButton.onClick.listen((MouseEvent e) {
              if (childTable.hidden) {
                childTable.show();
                childButton.text = 'Hide';
              } else {
                childTable.hide();
                childButton.text = 'Show';
              }
            });

            childTdElement.children.clear();
            childTdElement.children.add(childButton);
          }
        }
      }
      print(view.document.querySelector('#${view.did}')?.innerHtml);
      hidden = false;
    }
  }

  void hide() {
    if (shown) {
      view.document.querySelector('#${view.did}')?.innerHtml = '';
      hidden = true;
    }
  }
}
