# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".tinymce").tinymce
     
    theme: "advanced"
    plugins: "uploadimage,autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template"
    # theme_advanced_buttons1: "uploadimage,save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect"
    # theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor"
    # theme_advanced_buttons3: "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen"
    # theme_advanced_buttons4: "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage"
    theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontsizeselect,bullist,numlist,|,outdent,indent,|,link,unlink,image,code,|,forecolor,backcolor,|,pagebreak"
    theme_advanced_buttons2: ""
     
    theme_advanced_toolbar_location: "top"
    theme_advanced_toolbar_align: "left"
    theme_advanced_statusbar_location: "bottom"
    theme_advanced_resizing: true
    skin: "o2k7"
    skin_variant: "silver"
    content_css: "css/example.css"
    # template_external_list_url: "js/template_list.js"
    # external_link_list_url: "js/link_list.js"
    # external_image_list_url: "js/image_list.js"
    # media_external_list_url: "js/media_list.js"