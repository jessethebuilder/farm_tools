
//function onMediaQuery(screen_size, on_methods, off_methods) {
//  var size = parseScreenSize(screen_size);
//
//  enquire.register("screen and (max-width:" + size + "px)", [{
//    match: function () {
//      doMethods(on_methods);
//    },
//    unmatch: function () {
//      doMethods(off_methods);
//    }
//    }
//  ]);
//}

function onMediaQuery(screen_size, on_methods, off_methods) {
  doMethods(off_methods);

  var size = parseScreenSize(screen_size);

  enquire.register("screen and (max-width:" + size + "px)", {
    match: function () {
      doMethods(on_methods);
    },
    unmatch: function () {
      doMethods(off_methods);
    }
  });
}

function parseScreenSize(size){
  var val
  switch(size){
    case 'sm':
      val = 768;
      break;
    case 'md':
      val = 992;
      break;
    case 'lg':
      val = 1200;
      break;
    default:
      val = size;
  }
  return val;
}
