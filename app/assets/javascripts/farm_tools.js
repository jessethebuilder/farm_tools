//= require vendor/enquire
// require bootsy
//= require core
//= require behaviors
//= require quick_options

//Toolbox ---------------------------------------------
function splitPath(path){
  var file = path.match(/(.+\/)(\w+)\.(.+)/);
  return {
    path_to_file: file[1],
    file_name: file[2],
    extension: file[3]
  };
}
function removeQueryString(url){
  return url.split("?")[0];
}




