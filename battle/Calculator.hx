package battle;
import battle.BattleResult;
import data.Character;
import data.Skill.Limit;
import data.Skill.SkillType;
import haxe.ds.Option;


class Calculator
{

	public function new() 
	{
		
	}
	
	public static function attackTo(attacker:Character, defender:Character):BattleResult {
		
		var result = Util.createResult();
		
		var skill = attacker.weaponList[0].skillList[0];
		var damage = 0;
		switch(skill.type) {
			case SkillType.PHISICAL_ATTACK:
				damage = Std.int(skill.power * (attacker.at / defender.df));
				
			case SkillType.MAGICAL_ATTACK:
				damage = Std.int(skill.power * (attacker.mat / defender.mdf));
				
			case SkillType.HEAL:
				
			case SkillType.HEAL_CONDITION:
				
			case SkillType.ADD_CONDITION:
				
				
		}
		
		result.damage = damage;
		
		return result;
		
	}
	
	public static function pickTarget(attacker:Character, list:Array<Character>):Array<Character> {
		var result = [];
		
		//switch(attacker.activeSkill.type) {
			//case SkillType.PHISICAL_ATTACK | SkillType.MAGICAL_ATTACK:
				//for (chara in list) {
					//if (chara.teamIndex != attacker.teamIndex) {
						//result.push(chara);
					//}
				//}
		//}
		
		return result;
		
	}
	
	public static function evaluteLimit(attacker:Character, reciever:Character, limit:Limit):Bool {
		
		switch(limit) {
			case Limit.SUCCESS:
				return true;
				
			case Limit.ATTACKER_HP(ratio, child):
				if (ratio > attacker.hp / attacker.mhp) {
					return evaluteLimit(attacker, reciever, child);
				}else {
					return false;
				}
				
			case Limit.IN_TURN(turn, child):
				if (turn >= attacker.field.turn) {
					return evaluteLimit(attacker, reciever, child);
				}else {
					return false;
				}
				
			case Limit.OVER_TURN(turn, child):
				if (turn < attacker.field.turn) {
					return evaluteLimit(attacker, reciever, child);
				}else {
					return false;
				}
				
			case Limit.MULTIPLE_TURN(turn, child):
				if (attacker.field.turn % turn == 0) {
					return evaluteLimit(attacker, reciever, child);
				}else {
					return false;
				}
				
			case Limit.SKILL_TYPE(typeList, child):
				var eval:Bool = false;
				for (type in typeList) {
					if(Type.enumEq(attacker.activeSkill.type, type)) {
						eval = true;
						break;
					}
				}
				if (eval) {
					return evaluteLimit(attacker, reciever, child);
				}else {
					return false;
				}
				
			case Limit.SKILL_ELEMENT(element, child):
				if (Type.enumEq(attacker.activeSkill.element, element)) { 
					return evaluteLimit(attacker, reciever, child);
				}else {
					return false;
				}
				
			case Limit.TIMING(timing, child):
				return false;
				
			case Limit.RECIEVER_HP(ratio, child):
				return false;
				
			case Limit.DAMAGE_RATIO(ratio, child):
				return false;
				
		}
		
		
	}
	
}