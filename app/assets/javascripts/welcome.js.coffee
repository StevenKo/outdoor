# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

reload_masonry = ->
	$('#index_box_container').masonry({
    itemSelector : '.index_box',
    isAnimated: true,
    isFitWidth: true
  });
$ ->  
  reload_masonry
  window.setTimeout(reload_masonry, 100);
  window.setTimeout(reload_masonry, 300);
  window.setTimeout(reload_masonry, 1000);
  window.setTimeout(reload_masonry, 2000);
  window.setTimeout(reload_masonry, 3000);