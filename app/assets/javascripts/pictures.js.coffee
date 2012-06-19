# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  plUploader = new plupload.Uploader(
    runtimes: "html5,flash,silverlight"
    browse_button: "pickfiles"
    max_file_size: "5mb"
    url: "/pictures/upload"
    multipart_params:
      "<%= request_forgery_protection_token %>": "<%= form_authenticity_token %>"
      "<%= request.session_options[:key] %>": "<%= request.session_options[:id] %>"
  )
  # plUploader.bind "Init", (up, params) ->
  #     $("#filelist").html "<div>Current runtime: " + params.runtime + "</div>"
 
  plUploader.bind "FilesAdded", (up, files) ->
    $.each files, (i, file) ->
      $("#pictures-container").prepend "<div id=\"" + file.id + "\" class=\"modal-image\"><a href=\"#\" data-dismiss=\"modal\">" + "<img src='http://placehold.it/124X90&text="+file.name+"' >" + "</a></div>"
 
  # plUploader.bind "UploadProgress", (up, file ) ->
  #    $("#" + file.id).children().attr("src","http://ajaxload.info/cache/ff/ff/ff/00/00/00/1-0.gif")
    # $("#" + file.id + " b").html "<h5>上傳中..."+file.percent+"%</h5><div class=\"progress progress-danger progress-striped active\"><div class=\"bar\" style=\"width:"+ file.percent + "%;\"></div>" 
 
  plUploader.bind "FileUploaded", (up, file ,response) ->
    result = JSON.parse(response["response"])
    $("#" + file.id + " img").attr("src",result.median)
    $("#" + file.id + " img").attr("data-value",result.picture_id)
  $("#uploadfiles").click (e) ->
    plUploader.start()
    e.preventDefault()
 
  plUploader.init()