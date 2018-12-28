import 'destiny_record_component.dart';

/**  */
class DestinyProfileRecordsComponent{
	
	/** Your "Triumphs" score. */
	int score;
	
	/** If this profile is tracking a record, this is the hash identifier of the record it is tracking. */
	int trackedRecordHash;
	
	/**  */
	Map<String, DestinyRecordComponent> records;
	DestinyProfileRecordsComponent(
		this.score,
		this.trackedRecordHash,
		this.records,
	);

	static DestinyProfileRecordsComponent fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new DestinyProfileRecordsComponent(
				data['score'],
				data['trackedRecordHash'],
				data['records'] != null ? Map<String, DestinyRecordComponent>.from(data['records'].map((k, v)=>MapEntry(k, DestinyRecordComponent.fromMap(v)))) : null,
		);
	}

	static List<DestinyProfileRecordsComponent> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<DestinyProfileRecordsComponent> list = new List();
    data.forEach((item) {
      list.add(DestinyProfileRecordsComponent.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['score'] = this.score;
			data['trackedRecordHash'] = this.trackedRecordHash;
			data['records'] = this.records;
		return data;
	}
}