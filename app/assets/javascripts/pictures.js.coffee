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
  plUploader.bind "Init", (up, params) ->
    $("#filelist").html "<div>Current runtime: " + params.runtime + "</div>"
 
  plUploader.bind "FilesAdded", (up, files) ->
    $.each files, (i, file) ->
      $("#filelist").append "<div id=\"" + file.id + "\">" + file.name + " (" + plupload.formatSize(file.size) + ") <b></b>" + "</div>"
 
  plUploader.bind "UploadProgress", (up, file ) ->
    $("#" + file.id + " b").html file.percent + "%" 
 
  plUploader.bind "FileUploaded", (up, file ,response) ->
    result = JSON.parse(response["response"])
    $("#" + file.id + " ").append "<img src=\""+result.thumb+"\"  onclick=\"jQuery('#post_content').append('<img src="+result.median+">') \">"
 
  $("#uploadfiles").click (e) ->
    plUploader.start()
    e.preventDefault()
 
  plUploader.init()