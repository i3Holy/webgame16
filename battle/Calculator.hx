package battle;
import battle.BattleResult;
import data.Character;
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
				
		}
		
		result.damage = damage;
		
		return result;
		
	}
	
	public static function pickTarget(attacker:Character, list:Array<Character>):Option<Character> {
		var result = None;
		
		switch(attacker.activeSkill.type) {
			case SkillType.PHISICAL_ATTACK | SkillType.MAGICAL_ATTACK:
				for (chara in list) {
					if (chara.teamIndex != attacker.teamIndex) {
						result = Some(chara);
					}
				}
		}
		
		return result;
		
	}
	
}