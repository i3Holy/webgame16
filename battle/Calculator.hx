package battle;
import battle.BattleResult;
import data.Character;


class Calculator
{

	public function new() 
	{
		
	}
	
	public static function attackTo(attacker:Character, defender:Character):BattleResult {
		
		var result = Util.createResult();
		
		var damage = Std.int(100 * (attacker.at / defender.df));
		
		result.damage = damage;
		
		return result;
		
	}
	
}