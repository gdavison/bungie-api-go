import 'destiny_challenge_status.dart';
import 'destiny_milestone_activity_phase.dart';

/**  */
class DestinyMilestoneChallengeActivity{
	
	/**  */
	int activityHash;
	
	/**  */
	List<DestinyChallengeStatus> challenges;
	
	/** If the activity has modifiers, this will be the list of modifiers that all variants have in common. Perform lookups against DestinyActivityModifierDefinition which defines the modifier being applied to get at the modifier data.
Note that, in the DestiyActivityDefinition, you will see many more modifiers than this being referred to: those are all *possible* modifiers for the activity, not the active ones. Use only the active ones to match what's really live. */
	List<int> modifierHashes;
	
	/** The set of activity options for this activity, keyed by an identifier that's unique for this activity (not guaranteed to be unique between or across all activities, though should be unique for every *variant* of a given *conceptual* activity: for instance, the original D2 Raid has many variant DestinyActivityDefinitions. While other activities could potentially have the same option hashes, for any given D2 base Raid variant the hash will be unique).
As a concrete example of this data, the hashes you get for Raids will correspond to the currently active "Challenge Mode".
We don't have any human readable information for these, but saavy 3rd party app users could manually associate the key (a hash identifier for the "option" that is enabled/disabled) and the value (whether it's enabled or disabled presently)
On our side, we don't necessarily even know what these are used for (the game designers know, but we don't), and we have no human readable data for them. In order to use them, you will have to do some experimentation. */
	Map<String, bool> booleanActivityOptions;
	
	/** If returned, this is the index into the DestinyActivityDefinition's "loadouts" property, indicating the currently active loadout requirements. */
	int loadoutRequirementIndex;
	
	/** If the Activity has discrete "phases" that we can track, that info will be here. Otherwise, this value will be NULL. Note that this is a list and not a dictionary: the order implies the ascending order of phases or progression in this activity. */
	List<DestinyMilestoneActivityPhase> phases;
	DestinyMilestoneChallengeActivity(
		this.activityHash,
		this.challenges,
		this.modifierHashes,
		this.booleanActivityOptions,
		this.loadoutRequirementIndex,
		this.phases,
	);

	static DestinyMilestoneChallengeActivity fromMap(Map<String, dynamic> data){
		if(data == null) {
			return null;
		};
		return new DestinyMilestoneChallengeActivity(
				data['activityHash'],
				data['challenges'] != null ? DestinyChallengeStatus.fromList(data['challenges']) : null,
				data['modifierHashes'] != null ? data['modifierHashes']?.cast<int>() ?? null : null,
				data['booleanActivityOptions'] != null ? Map<String, bool>.from(data['booleanActivityOptions'].map((k, v)=>MapEntry(k, v))) : null,
				data['loadoutRequirementIndex'],
				data['phases'] != null ? DestinyMilestoneActivityPhase.fromList(data['phases']) : null,
		);
	}

	static List<DestinyMilestoneChallengeActivity> fromList(List<dynamic> data){
		if(data == null) {
			return null;
		};
		List<DestinyMilestoneChallengeActivity> list = new List();
    data.forEach((item) {
      list.add(DestinyMilestoneChallengeActivity.fromMap(item));
    });
    return list;
	}

	Map<String, dynamic> toMap(){
		Map<String, dynamic> data = new Map();
			data['activityHash'] = this.activityHash;
			data['challenges'] = this.challenges.map((item)=>item.toMap()).toList();
			data['modifierHashes'] = this.modifierHashes;
			data['booleanActivityOptions'] = this.booleanActivityOptions;
			data['loadoutRequirementIndex'] = this.loadoutRequirementIndex;
			data['phases'] = this.phases.map((item)=>item.toMap()).toList();
		return data;
	}
}