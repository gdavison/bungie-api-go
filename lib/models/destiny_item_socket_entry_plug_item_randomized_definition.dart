
/**  */
class DestinyItemSocketEntryPlugItemRandomizedDefinition{
	
	/** The hash identifier of a DestinyInventoryItemDefinition representing the plug that can be inserted. */
	int plugItemHash;
	DestinyItemSocketEntryPlugItemRandomizedDefinition(
		this.plugItemHash,
	);

	static DestinyItemSocketEntryPlugItemRandomizedDefinition fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new DestinyItemSocketEntryPlugItemRandomizedDefinition(
				data['plugItemHash'],
		);
	}

	static List<DestinyItemSocketEntryPlugItemRandomizedDefinition> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<DestinyItemSocketEntryPlugItemRandomizedDefinition> list = new List();
    data.forEach((item) {
      list.add(DestinyItemSocketEntryPlugItemRandomizedDefinition.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['plugItemHash'] = this.plugItemHash;
		return data;
	}
}