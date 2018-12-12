import 'group_v2.dart';
class GroupMembershipBase{
	GroupV2 group;
	GroupMembershipBase(
		GroupV2 this.group,
	);

	static GroupMembershipBase fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new GroupMembershipBase(
				GroupV2.fromMap(data['group']),
		);
	}

	static List<GroupMembershipBase> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<GroupMembershipBase> list = new List();
    data.forEach((item) {
      list.add(GroupMembershipBase.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['group'] = this.group.toMap();
		return data;
	}
}