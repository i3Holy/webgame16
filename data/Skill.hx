package data;

class Skill
{

	public var type:SkillType = PHISICAL_ATTACK;
	
	public var power:Float = 100;
	public var name:String = "";
	
	public function new() 
	{
		
	}
	
	public function setData(data:SkillData) {
		type = data.type;
		power = data.power;
		name = data.name;
	}
	
}

enum SkillType {
	PHISICAL_ATTACK;
	MAGICAL_ATTACK;
	
}

typedef SkillData = {
	power:Float,
	name:String,
	type:SkillType
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