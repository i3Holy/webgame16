package battle;
import data.Condition;

enum TacticsTree
{
	
	SIGN(value:Int, child:Array<TacticsTree>);
	
	SELF_HP(ratio:Float, child:Array<TacticsTree>);
	ALLY_HP(ratio:Float, child:Array<TacticsTree>);
	
	SELF_CONDITION(type:Condition, child:Array<TacticsTree>);
	ALLY_CONDITION(type:Condition, child:Array<TacticsTree>);
	
	OVER_TURN(turn:Int, child:Array<TacticsTree>);
	IN_TURN(turn:Int, child:Array<TacticsTree>);
	MULTIPLE_TURN(turn:Int, child:Array<TacticsTree>);
	
	EXECUTE(index:Int);
	
}