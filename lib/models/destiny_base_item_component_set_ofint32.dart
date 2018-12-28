import 'dictionary_component_response_ofint32_and_destiny_item_objectives_component.dart';

/**  */
class DestinyBaseItemComponentSetOfint32{
	
	/**  */
	DictionaryComponentResponseOfint32AndDestinyItemObjectivesComponent objectives;
	DestinyBaseItemComponentSetOfint32(
		this.objectives,
	);

	static DestinyBaseItemComponentSetOfint32 fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new DestinyBaseItemComponentSetOfint32(
				data['objectives'] != null ? DictionaryComponentResponseOfint32AndDestinyItemObjectivesComponent.fromMap(data['objectives']) : null,
		);
	}

	static List<DestinyBaseItemComponentSetOfint32> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<DestinyBaseItemComponentSetOfint32> list = new List();
    data.forEach((item) {
      list.add(DestinyBaseItemComponentSetOfint32.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['objectives'] = this.objectives.toMap();
		return data;
	}
}