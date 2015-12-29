package battle;
using util.OptionHelper;
using battle.Calculator;

class Field
{

	private var timeLine:TimeLine;
	
	public var turn:Int = 0;
	
	public function new() 
	{
		
	}
	
	public function execute():Array<BattleResult> {
		var result:Array<BattleResult> = [];
		
		var executed:Int = 0;
		
		for (i in 0...1000) {
			var isExe = timeLine.next();
			isExe.iter(function(chara):Void {
				var targetList = chara.pickTarget(timeLine.list);
				for (target in targetList) {
					chara.attackTo(target);
				}
				if (targetList.length > 0) executed++;
			});
			if (executed > 100) break;
		}
		
		return result;
	}
	
}