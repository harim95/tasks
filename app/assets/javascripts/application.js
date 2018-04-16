// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require rails-ujs
//= require_tree .
//= require jquery
//= require popper
//= require bootstrap-sprockets

$(function(){
    $('#formActivities').keypress(function(e) {
        if(e.keyCode == 13) {
            $.ajax({
                url:$("#activityCreate").val(),
                type: "POST",
                data: {
                    name:$("#activityName").val()
                },
                success:function (data) {
                    console.log(data);
                    $("#listActivities").append('<li class="list-group-item">'+$("#activityName").val()+'</li>');
                    $("#formActivities")[0].reset();
                },
                error:function (data) {
                }
            })
        }
    });

    $(".list-group-item").dblclick(function(){
        var activity_id = $(this).attr("activity_id"); //obtener el id de un elemento
        $("#id_activity").val(activity_id);
        $('#myModal').modal('show');
        $.ajax({
            url:"/activities/" + activity_id + ".json",
            type:"GET",
            success: function (data) {
                console.log(data);
            $("#activityNameModal").val(data.name);
            $("#activityDescription").val(data.description);
            $("#activityEndDate").val(data.enddate);
            

            }

        })

    });
    $("#updateActivity").click(function(){
        id= $("#id_activity").val();
        var members = $.map($('input[name="activityMembers"]:checked'), function(c){return c.value; });
        var ajax_url = "activities/" + id + ".json";
        $.ajax({
            url:ajax_url,
            method:"PUT",
            data:{
                activity:{
                    name:$("#activityNameModal").val(),
                    description:$("#activityDescription").val(),
                    enddate:$("#activityEndDate").val(),
                    member_ids: members
                }
            },
            success: function (data) {
                console.log (data)

            }
        })


    })

})