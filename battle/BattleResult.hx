package battle;


typedef BattleResult =
{
	attackerName:String,
	defenderName:String,
	damage:Int,
	children:Array<BattleResult>
	
}