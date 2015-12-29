package data;
import battle.Element;
import data.Skill.Limit;
import data.Skill.Timing;

class Skill
{

	public var type:SkillType = PHISICAL_ATTACK;
	
	public var limit:Limit = TIMING(ACTIVE, SUCCESS);
	
	public var power:Float = 100;
	public var name:String = "";
	
	public var element:Element;
	
	public function new() 
	{
		
	}
	
	public function setData(data:SkillData) {
		type = data.type;
		power = data.power;
		name = data.name;
		limit = data.limit;
	}
	
}

enum SkillType {
	
	PHISICAL_ATTACK;
	MAGICAL_ATTACK;
	HEAL;
	HEAL_CONDITION;
	ADD_CONDITION(value:Condition);
	
}

typedef SkillData = {
	power:Float,
	name:String,
	type:SkillType,
	limit:Limit
}

enum TargetType {
	
	WEAK_ENEMY;
	WEAK_ALLY;
	RANDOM_ENEMY;
	RANDOM_ALLY;
	ALL_ENEMY;
	ALL_ALLY;
	LINE_ENEMY;
	LINE_ALLY;
	
}

enum Timing {
	ACTIVE;
	
	ATTACK_FINISHED;
	BEFORE_ATTACK;
	AVOID;
	RECIEVE;
	
}

enum Limit {
	
	TIMING(type:Timing, child:Limit);
	
	SKILL_TYPE(type:Array<SkillType>, child:Limit);
	SKILL_ELEMENT(element:Element, child:Limit);
	DAMAGE_RATIO(ratio:Float, child:Limit);
	
	ATTACKER_HP(ratio:Float, child:Limit);
	RECIEVER_HP(ratio:Float, child:Limit);
	
	OVER_TURN(value:Int, child:Limit);
	IN_TURN(value:Int, child:Limit);
	MULTIPLE_TURN(value:Int, child:Limit);
	
	SUCCESS;
	
}