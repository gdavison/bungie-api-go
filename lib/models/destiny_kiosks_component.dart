import 'destiny_kiosk_item.dart';
class DestinyKiosksComponent{
	Map<List<DestinyKioskItem>, dynamic> kioskItems;
	DestinyKiosksComponent(
		Map<List<DestinyKioskItem>, dynamic> this.kioskItems,
	);

	static DestinyKiosksComponent fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new DestinyKiosksComponent(
				data['kioskItems'],
		);
	}

	static List<DestinyKiosksComponent> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<DestinyKiosksComponent> list = new List();
    data.forEach((item) {
      list.add(DestinyKiosksComponent.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['kioskItems'] = this.kioskItems;
		return data;
	}
}