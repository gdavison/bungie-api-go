import '../helpers/http.dart';
import '../responses/post_search_response_response.dart';
import '../responses/int64_response.dart';
import '../responses/list_of_tag_response_response.dart';
import '../responses/forum_recruitment_detail_response.dart';
import '../responses/save_message_result_response.dart';
import '../responses/celist_of_forum_recruitment_detail_response.dart';
class Forum{
    
    /** Get topics from any forum. */
    static Future<PostSearchResponseResponse> getTopicsPaged (
        HttpClient client,
        int categoryFilter,
        String group,
        String locales,
        int page,
        int pageSize,
        int quickDate,
        int sort,
        String tagstring,
    ) {
        Map<String, dynamic> params = new Map();
        params['locales'] = locales;
        params['tagstring'] = tagstring;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetTopicsPaged/${page}/${pageSize}/${group}/${sort}/${quickDate}/${categoryFilter}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Gets a listing of all topics marked as part of the core group. */
    static Future<PostSearchResponseResponse> getCoreTopicsPaged (
        HttpClient client,
        int categoryFilter,
        String locales,
        int page,
        int quickDate,
        int sort,
    ) {
        Map<String, dynamic> params = new Map();
        params['locales'] = locales;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetCoreTopicsPaged/${page}/${sort}/${quickDate}/${categoryFilter}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Returns a thread of posts at the given parent, optionally returning replies to those posts as well as the original parent. */
    static Future<PostSearchResponseResponse> getPostsThreadedPaged (
        HttpClient client,
        bool getParentPost,
        int page,
        int pageSize,
        String parentPostId,
        int replySize,
        bool rootThreadMode,
        String showbanned,
        int sortMode,
    ) {
        Map<String, dynamic> params = new Map();
        params['showbanned'] = showbanned;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetPostsThreadedPaged/${parentPostId}/${page}/${pageSize}/${replySize}/${getParentPost}/${rootThreadMode}/${sortMode}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Returns a thread of posts starting at the topicId of the input childPostId, optionally returning replies to those posts as well as the original parent. */
    static Future<PostSearchResponseResponse> getPostsThreadedPagedFromChild (
        HttpClient client,
        String childPostId,
        int page,
        int pageSize,
        int replySize,
        bool rootThreadMode,
        String showbanned,
        int sortMode,
    ) {
        Map<String, dynamic> params = new Map();
        params['showbanned'] = showbanned;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetPostsThreadedPagedFromChild/${childPostId}/${page}/${pageSize}/${replySize}/${rootThreadMode}/${sortMode}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Returns the post specified and its immediate parent. */
    static Future<PostSearchResponseResponse> getPostAndParent (
        HttpClient client,
        String childPostId,
        String showbanned,
    ) {
        Map<String, dynamic> params = new Map();
        params['showbanned'] = showbanned;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetPostAndParent/${childPostId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Returns the post specified and its immediate parent of posts that are awaiting approval. */
    static Future<PostSearchResponseResponse> getPostAndParentAwaitingApproval (
        HttpClient client,
        String childPostId,
        String showbanned,
    ) {
        Map<String, dynamic> params = new Map();
        params['showbanned'] = showbanned;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetPostAndParentAwaitingApproval/${childPostId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Gets the post Id for the given content item's comments, if it exists. */
    static Future<int64Response> getTopicForContent (
        HttpClient client,
        String contentId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetTopicForContent/${contentId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return int64Response.fromMap(response);
        });
    }
    
    /** Gets tag suggestions based on partial text entry, matching them with other tags previously used in the forums. */
    static Future<ListOfTagResponseResponse> getForumTagSuggestions (
        HttpClient client,
        String partialtag,
    ) {
        Map<String, dynamic> params = new Map();
        params['partialtag'] = partialtag;
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/GetForumTagSuggestions/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return ListOfTagResponseResponse.fromMap(response);
        });
    }
    
    /** Gets the specified forum poll. */
    static Future<PostSearchResponseResponse> getPoll (
        HttpClient client,
        String topicId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/Forum/Poll/${topicId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return PostSearchResponseResponse.fromMap(response);
        });
    }
    
    /** Allows a user to slot themselves into a recruitment thread fireteam slot. Returns the new state of the fireteam. */
    static Future<ForumRecruitmentDetailResponse> joinFireteamThread (
        HttpClient client,
        String topicId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('POST', "/Forum/Recruit/Join/${topicId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return ForumRecruitmentDetailResponse.fromMap(response);
        });
    }
    
    /** Allows a user to remove themselves from a recruitment thread fireteam slot. Returns the new state of the fireteam. */
    static Future<ForumRecruitmentDetailResponse> leaveFireteamThread (
        HttpClient client,
        String topicId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('POST', "/Forum/Recruit/Leave/${topicId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return ForumRecruitmentDetailResponse.fromMap(response);
        });
    }
    
    /** Allows a recruitment thread owner to kick a join user from the fireteam. Returns the new state of the fireteam. */
    static Future<ForumRecruitmentDetailResponse> kickBanFireteamApplicant (
        HttpClient client,
        String targetMembershipId,
        String topicId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('POST', "/Forum/Recruit/KickBan/${topicId}/${targetMembershipId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return ForumRecruitmentDetailResponse.fromMap(response);
        });
    }
    
    /** Allows the owner of a fireteam thread to approve all joined members and start a private message conversation with them. */
    static Future<SaveMessageResultResponse> approveFireteamThread (
        HttpClient client,
        String topicId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('POST', "/Forum/Recruit/Approve/${topicId}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            return SaveMessageResultResponse.fromMap(response);
        });
    }
    
    /** Allows the caller to get a list of to 25 recruitment thread summary information objects. */
    static Future<CEListOfForumRecruitmentDetailResponse> getRecruitmentThreadSummaries (
        HttpClient client,
        List<String> body
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('POST', "/Forum/Recruit/Summaries/", params);
        config.body = body;
        config.bodyContentType = 'application/json';
        return client.request(config).then((response){
            return CEListOfForumRecruitmentDetailResponse.fromMap(response);
        });
    }
}