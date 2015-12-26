package battle;

class Util
{

	public function new() 
	{
		
	}
	
	public static function createResult():BattleResult {
		var result = {
			attackerName:"",
			defenderName:"",
			damage:0,
			children:[]
		}
		return result;
		
	}
	
}