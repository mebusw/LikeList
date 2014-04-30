$(document).ready(
        function() {
            $("#tabs").mytab({tab:"#tabs"});

            
            $("#toList").autocomplete("../action/findFriend.jsp", {
                minChars: 0,
                width: 310,
                matchContains: "word",
                autoFill: false,
                multiple: false,
                dataType: "json",
                parse: function(data) {
                    return $.map(data.friends, function(row) {
                        return {
                            data: row,
                            value: row.fullName,
                            result: row.fullName + " <" + row.userId + ">"
                        }
                    });
                },
                formatItem: function(row, i, max) {
                    return i + "/" + max + ": \"" + row.fullName + "\" [" + row.userId + "]";
                },
                formatMatch: function(row, i, max) {
                    return row.fullName + " " + row.userId;
                },
                formatResult: function(row) {
                    return row.userId;
                }
            }).result(function(event, row, formatted) {
                if (row)
                    $(this).next("input").val(row.userId);
            });


            $("#sendSms").ajaxForm( {
                dataType : 'json',
                success : function(data) {
                    
                    switch (data.ec) {
                    case 0:
                        alert("成功发送");
                    }
                }
            });

            inviteFriendAjax();

        });// end of $(document).ready

