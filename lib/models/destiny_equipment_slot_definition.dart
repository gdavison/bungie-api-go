import 'destiny_display_properties_definition.dart';
import 'destiny_art_dye_reference.dart';
class DestinyEquipmentSlotDefinition{
	DestinyDisplayPropertiesDefinition displayProperties;
	int equipmentCategoryHash;
	int bucketTypeHash;
	bool applyCustomArtDyes;
	List<DestinyArtDyeReference> artDyeChannels;
	int hash;
	int index;
	bool redacted;
	DestinyEquipmentSlotDefinition(
		DestinyDisplayPropertiesDefinition this.displayProperties,
		int this.equipmentCategoryHash,
		int this.bucketTypeHash,
		bool this.applyCustomArtDyes,
		List<DestinyArtDyeReference> this.artDyeChannels,
		int this.hash,
		int this.index,
		bool this.redacted,
	);

	static DestinyEquipmentSlotDefinition fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new DestinyEquipmentSlotDefinition(
				DestinyDisplayPropertiesDefinition.fromMap(data['displayProperties']),
				data['equipmentCategoryHash'],
				data['bucketTypeHash'],
				data['applyCustomArtDyes'],
				DestinyArtDyeReference.fromList(data['artDyeChannels']),
				data['hash'],
				data['index'],
				data['redacted'],
		);
	}

	static List<DestinyEquipmentSlotDefinition> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<DestinyEquipmentSlotDefinition> list = new List();
    data.forEach((item) {
      list.add(DestinyEquipmentSlotDefinition.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['displayProperties'] = this.displayProperties.toMap();
			data['equipmentCategoryHash'] = this.equipmentCategoryHash;
			data['bucketTypeHash'] = this.bucketTypeHash;
			data['applyCustomArtDyes'] = this.applyCustomArtDyes;
			data['artDyeChannels'] = this.artDyeChannels.map((item)=>item.toMap());
			data['hash'] = this.hash;
			data['index'] = this.index;
			data['redacted'] = this.redacted;
		return data;
	}
}