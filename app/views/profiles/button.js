- if current_user.followes?(profile.user)
    $("#user-#{@user.id}").html("#{link_to('Follow', follow_profile_path(@profile.id), method: :post, remote: true}")
- else
    $("#user-#{@user.id}").html("#{link_to('Unfollow', unfollow_profile_path(@profile.id), method: :post, remote: true}")