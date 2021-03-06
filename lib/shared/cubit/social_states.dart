abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialChangeNavBarState extends SocialStates {}

class SocialNewPostState extends SocialStates {}

class SocialGetUserDataLoadingStates extends SocialStates {}

class SocialGetUserDataSuccessStates extends SocialStates {}

class SocialGetUserDataErrorStates extends SocialStates {
  final String error;

  SocialGetUserDataErrorStates(this.error);
}

class SocialGetAllUsersLoadingStates extends SocialStates {}

class SocialGetAllUsersSuccessStates extends SocialStates {}

class SocialGetAllUsersErrorStates extends SocialStates {
  final String error;

  SocialGetAllUsersErrorStates(this.error);
}

class SocialGetUsersWithChatLoadingStates extends SocialStates {}

class SocialGetUsersWithChatSuccessStates extends SocialStates {}

class SocialGetUsersWithChatErrorStates extends SocialStates {
  final String error;

  SocialGetUsersWithChatErrorStates(this.error);
}

class SocialProfileImageSuccessStates extends SocialStates {}

class SocialProfileImageErrorStates extends SocialStates {}

class SocialCoverImageSuccessStates extends SocialStates {}

class SocialCoverImageErrorStates extends SocialStates {}

class SocialPostImagePickedSuccessStates extends SocialStates {}

class SocialPostImagePickedErrorStates extends SocialStates {}

class SocialUploadProfileImageSuccessStates extends SocialStates {}

class SocialUploadProfileImageErrorStates extends SocialStates {}

class SocialUploadCoverImageErrorStates extends SocialStates {}

class SocialUploadCoverImageSuccessStates extends SocialStates {}

class SocialUploadImageErrorStates extends SocialStates {}

class SocialUserUpdateErrorStates extends SocialStates {}

class SocialLoadingUserUpdateStates extends SocialStates {}

class SocialUpdateSuccessfullySuccessStates extends SocialStates {}

//create post
class SocialCreatePostLoadingStates extends SocialStates {}

class SocialCreatePostSuccessStates extends SocialStates {}

class SocialCreatePostErrorStates extends SocialStates {}

class SocialRemovePostImageStates extends SocialStates {}

class SocialGetPostsDataLoadingStates extends SocialStates {}

class SocialGetPostsDataSuccessStates extends SocialStates {}

class SocialGetPostsDataErrorStates extends SocialStates {
  final String error;

  SocialGetPostsDataErrorStates(this.error);
}

class SocialGetLivePostsDataLoadingStates extends SocialStates {}

class SocialGetLivePostsDataSuccessStates extends SocialStates {}

class SocialGetLivePostsDataErrorStates extends SocialStates {
  final String error;

  SocialGetLivePostsDataErrorStates(this.error);
}

class SocialLikePostsLoadingStates extends SocialStates {}

class SocialLikePostsSuccessStates extends SocialStates {}

class SocialLikePostsErrorStates extends SocialStates {
  final String error;

  SocialLikePostsErrorStates(this.error);
}

class SocialCommentsPostsLoadingStates extends SocialStates {}

class SocialCommentsPostsSuccessStates extends SocialStates {}

class SocialCommentsPostsErrorStates extends SocialStates {
  final String error;

  SocialCommentsPostsErrorStates(this.error);
}
class SocialGetLikesLoadingStates extends SocialStates {}

class SocialGetLikesSuccessStates extends SocialStates {}



class SocialGetCommentsLoadingStates extends SocialStates {}

class SocialGetCommentsSuccessStates extends SocialStates {}



class SocialSendMessageSuccessStates extends SocialStates {}

class SocialSendMessageErrorStates extends SocialStates {}

class SocialGetMessagesSuccessStates extends SocialStates {}

class SocialGetMessagesLoadingStates extends SocialStates {}

class SocialDeletePostSuccessStates extends SocialStates {}

class SocialDeletePostErrorStates extends SocialStates {
  final String error;

  SocialDeletePostErrorStates(this.error);
}
