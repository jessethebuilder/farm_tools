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