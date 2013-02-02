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

  $(".one_level_sortable").nestedSortable
   listType: "ul"
   handle: ".sort_handle"
   items: "li"
   toleranceElement: "> div"
   disableNesting: true
   update: (event, ui) ->
    mylist = $(".one_level_sortable").sortable('serialize')
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

  $('.add_content_link').live 'click', (event) ->
    if $('.add_content_link').hasClass('disabled')
      return false
    else
      $('.add_content_link').addClass('disabled')
      $('#add_new').append('<div class="add_content_part_input"><label>New Section Name</label><input type="text"></input><br /><a href="#" id="submit_content_part" class="btn btn-primary">Add Section</a></div>')
      $('.add_content_link').tab('show');
      return false

  $('#submit_content_part').on 'click', (event) ->
    $.ajax
      url: '/admin/content_sections.js'
      type: 'POST'
      data:
        resource: $('.add_content_tab').data('resource')
        resource_id: $('.add_content_tab').data('id')
        name: $('.add_content_part_input input').val()
    $('.add_content_part_input').remove();
    $('.add_content_link').removeClass('disabled')

  $("#draggable li" ).draggable(revert: true, cursor: "move");

  $("#droppable").droppable
    drop: (event, ui) ->
      $.ajax
        url: '/admin/assets/add_image.js'
        type: 'POST'
        data:
          resource: $(ui.draggable).data('resource')
          resource_id: $(ui.draggable).data('resource-id')
          asset_id: $(ui.draggable).data('asset-id')