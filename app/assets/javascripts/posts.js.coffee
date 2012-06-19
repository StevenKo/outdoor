# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$(".main-pic a").click (e) ->
		$("#pictureflag").text('main')
	$('#insert-image').click (e) ->
		$("#pictureflag").text('text')
	insert_picture = (e) ->
		if $("#pictureflag").text() == 'main'
			$("#picture_id").attr("value",$(this).children().data('value'))
			$("#main-pic").attr("src",$(this).children().attr('src'))
		else
		  $('#post_content').append('<img src='+$(this).children().attr('src')+'>')
		  $('#share_post_content').append('<img src='+$(this).children().attr('src')+'>')
		  $('#topic_content').append('<img src='+$(this).children().attr('src')+'>')
	$(".modal-image a").live("click",insert_picture)

	# 	link_image = $(this)
	# 	$(".modal-image a").click (e) ->
	# 		# alert($(this).children().attr('src'))
	# 		link_image.children().attr("src",$(this).children().attr('src'))
	# $('#insert-image').click (e) ->
	#   $(".modal-image a").click (e) ->
	#     $('#post_content').append('<img src='+$(this).children().attr('src')+'>')
	# 
	# 
	# $ ->
	#   test1 = (e) ->
	# 	  alert($(this).children().attr('src'))
	# 	  $("#main-pic").attr("src",$(this).children().attr('src'))
	#   test2 = (e) ->
	# 	  $('#post_content').append('<img src='+$(this).children().attr('src')+'>')
	# 	$(".main-pic a").click (e) ->
	# 		$(".modal-image a").bind("click",test1)
	# 		$(".modal-image a").unbind("click",test2)
	# $ ->  
	#   test1 = (e) ->
	# 	  alert($(this).children().attr('src'))
	# 	  $("#main-pic").attr("src",$(this).children().attr('src'))
	#   test2 = (e) ->
	# 	  $('#post_content').append('<img src='+$(this).children().attr('src')+'>')
	#   $('#insert-image').click (e) ->
	# 	  $(".modal-image a").bind("click",test2)
	# 		$(".modal-image a").unbind("click",test1)
	