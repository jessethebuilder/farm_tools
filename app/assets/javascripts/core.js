//-----rgb to hex
var hexDigits = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");

function rgb2hex(rgb) {
  rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
  return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
}

//--------do methods

//push methods into ready methods
var ready_methods = [];

function doReadyMethods(){
  doMethodsOnLoad(ready_methods)
}

function doMethodsOnLoad(methods){
  $(document).ready(function(){
    doMethods(methods);
  })
  $(document).on('page:load', function(){
    doMethods(methods);
  })
}

function doMethods(methods){
  //accepts either a method or an array of methods. Put method in array if necessary
  if(typeof methods == "function"){methods = [methods]}

  methods.forEach(function(method){
    method();
  })
}
