/*----------------------------------
-hover
-show hide

-----------------------------------*/
//-----------on hover methods-------------

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

function underlineLineItemLink(list_selector, hover_color){
  var line_item_selector = 'ul' + list_selector + ' li';
  var original_color = rgb2hex($(line_item_selector).css('border-bottom-color'));
  $(line_item_selector + ' a').hover(function(){
    $(this).closest('li').css('border-bottom-color', hover_color);
  }, function(){
    $(this).closest('li').css('border-bottom-color', original_color);
  })
}

//-----------show hide-----------------

function hideOnClickAndShow(click_selector, show_selector, hide_selector){
  $(document).ready(function(){
    $(show_selector).css('display', 'none');
  });

  $(document).on('click', click_selector, function(e){
    e.preventDefault();
    $(hide_selector).css('display', 'none');
    $(show_selector).css('display', 'block');
  });
}
