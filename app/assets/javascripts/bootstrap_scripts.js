
function onMediaQuery(screen_size, on_methods, off_methods) {
  var size = parseScreenSize(screen_size);

  enquire.register("screen and (max-width:" + size + "px)", [{
    match: function () {
      if(typeof on_methods == "function"){on_methods = [on_methods]}
      on_methods.forEach(function(method){
        method();
      })
    },
    unmatch: function () {
      if(typeof off_methods == "function"){off_methods = [off_methods]}
      off_methods.forEach(function(method){
        method();
      })

    }
  }
  ])
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
