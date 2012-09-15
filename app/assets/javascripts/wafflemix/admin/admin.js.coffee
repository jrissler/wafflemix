$(document).ready ->
  $(".sortable").nestedSortable
   listType: "ul"
   handle: ".sort_handle"
   items: "li"
   toleranceElement: "> div"
   forcePlaceholderSize: true
   placeholder: 'placeholder'
   update: (event, ui) ->
    mylist = $(".sortable").sortable('serialize')
    mylist = mylist.replace(/root/g, "")
    finalstring = ""
    $(mylist.split("&")).each (index) ->
      string2 = @split("[")
      type = string2[0]
      string3 = string2[1].split("]")
      id = string3[0]
      fragments = @split("=")
      parent_id = fragments[1]
      finalstring = finalstring + type + "[" + index + "]" + "[id]=" + id + "&" + type + "[" + index + "][parent_id]=" + parent_id + "&" + type + "[" + index + "][position]=" + index + "&"
    $.post($(this).data('update-url'), finalstring)