$ ->
    $("#story-tags").tagit
     fieldName:  "category_list"
     singleField: true
    $("#story-tags").tagit()
    category_string = $("#category_hidden").val()
    try
        category_list = category_string.split(",")
        for tag in category_list
            $("#story-tags").tagit "createTag", tag
    catch error