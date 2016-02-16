// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

//import 'package:angular2/bootstrap.dart';

import 'dart:async';
import 'package:dart_slickgrid/slickgrid-wrapper/grid.dart';
import 'package:js/js.dart';
import 'dart:convert';

@JS('JSON.parse')
external dynamic JSONParse(String value);

main() {
//  bootstrap(AppComponent);

  new Timer(new Duration(seconds: 1), () {
    var columns = [
      new SlickGridColumn(id: "title", name: "Title", field: "title")
    ];

    var dataViewOptions = new SlickDataViewOptions(
        groupItemMetadataProvider: new SlickDataGroupItemMetadataProvider(),
        inlineFilters: true
    );


    var items = JSON.encode([{"title":"Test111"}, {"title":"Test2222"}, {"title":"Test333"}]);

    var options = new SlickGridOptions(enableColumnReorder: false);

    var dataview1 = new SlickDataView(dataViewOptions);
    var grid = new SlickGrid("#myGrid2", dataview1, columns, options);
    grid.invalidate();
    var itemsJs = JSONParse(items);
    dataview1.setItems(itemsJs, "title");
    grid.invalidate();
  });
}
