//= require quick_options
//= require bootstrap_scripts

function removeQueryString(url){
    return url.split("?")[0];
}
function hideOnClickAndShow(click_selector, show_selector, hide_selector){
 $(document).ready(function(){
//     $(show_selector).hide();
     $(show_selector).css('display', 'none');
  });

  $(document).on('click', click_selector, function(e){
     e.preventDefault();
//     $(hide_selector).hide();
     $(hide_selector).css('display', 'none');
//     $(show_selector).show();
     $(show_selector).css('display', 'block');
  });
}


//Toolbox ---------------------------------------------
function splitPath(path){
  var file = path.match(/(.+\/)(\w+)\.(.+)/);
  return {
    path_to_file: file[1],
    file_name: file[2],
    extension: file[3]
  };

}
function imageChangeOnLinkHover(selector){
  $(selector).hover(function(){
    var img = $(this).find('img');
    var split_path = splitPath(img.attr('src'));
    var new_path = split_path.path_to_file + split_path.file_name + "_hover." + split_path.extension;
    img.attr('src', new_path);
  }, function(){
    var split_path = splitPath($(this).find('img').attr('src'));
    var new_file_name = split_path.file_name.match(/(.+)_hover/)[1]
    var new_path = split_path.path_to_file + new_file_name + "." + split_path.extension;
    $(this).find('img').attr('src', new_path);
  })
}

function toggleClassOnHover(selector, klass, persist){
  $(selector).hover(function(){
    $(this).addClass(klass);
  }, function(){
    $(this).removeClass(klass);
  })
}
