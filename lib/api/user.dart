import '../helpers/http.dart';
import '../responses/general_user_response.dart';
import '../responses/list_of_general_user_response.dart';
import '../responses/list_of_user_theme_response.dart';
import '../responses/user_membership_data_response.dart';
import '../responses/celist_of_public_partnership_detail_response.dart';
class User{
    
    /** Loads a bungienet user by membership id. */
    static Future<GeneralUserResponse> getBungieNetUserById (
        HttpClient client,
        String id,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/User/GetBungieNetUserById/${id}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            if(response.statusCode == 200){
                return GeneralUserResponse.fromMap(response.mappedBody);
            }
            throw Exception(response.mappedBody);
        });
    }
    
    /** Returns a list of possible users based on the search string */
    static Future<ListOfGeneralUserResponse> searchUsers (
        HttpClient client,
        String q,
    ) {
        Map<String, dynamic> params = new Map();
        params['q'] = q;
        HttpClientConfig config = HttpClientConfig('GET', "/User/SearchUsers/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            if(response.statusCode == 200){
                return ListOfGeneralUserResponse.fromMap(response.mappedBody);
            }
            throw Exception(response.mappedBody);
        });
    }
    
    /** Returns a list of all available user themes. */
    static Future<ListOfUserThemeResponse> getAvailableThemes (
        HttpClient client,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/User/GetAvailableThemes/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            if(response.statusCode == 200){
                return ListOfUserThemeResponse.fromMap(response.mappedBody);
            }
            throw Exception(response.mappedBody);
        });
    }
    
    /** Returns a list of accounts associated with the supplied membership ID and membership type. This will include all linked accounts (even when hidden) if supplied credentials permit it. */
    static Future<UserMembershipDataResponse> getMembershipDataById (
        HttpClient client,
        String membershipId,
        int membershipType,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/User/GetMembershipsById/${membershipId}/${membershipType}/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            if(response.statusCode == 200){
                return UserMembershipDataResponse.fromMap(response.mappedBody);
            }
            throw Exception(response.mappedBody);
        });
    }
    
    /** Returns a list of accounts associated with signed in user. This is useful for OAuth implementations that do not give you access to the token response. */
    static Future<UserMembershipDataResponse> getMembershipDataForCurrentUser (
        HttpClient client,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/User/GetMembershipsForCurrentUser/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            if(response.statusCode == 200){
                return UserMembershipDataResponse.fromMap(response.mappedBody);
            }
            throw Exception(response.mappedBody);
        });
    }
    
    /** Returns a user's linked Partnerships. */
    static Future<CEListOfPublicPartnershipDetailResponse> getPartnerships (
        HttpClient client,
        String membershipId,
    ) {
        Map<String, dynamic> params = new Map();
        HttpClientConfig config = HttpClientConfig('GET', "/User/${membershipId}/Partnerships/", params);
        config.bodyContentType = null;
        return client.request(config).then((response){
            if(response.statusCode == 200){
                return CEListOfPublicPartnershipDetailResponse.fromMap(response.mappedBody);
            }
            throw Exception(response.mappedBody);
        });
    }
}