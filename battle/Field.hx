package battle;
using util.OptionHelper;
using battle.Calculator;

class Field
{

	private var timeLine:TimeLine;
	
	public function new() 
	{
		
	}
	
	public function execute():Void {
		var result:Array<BattleResult> = [];
		
		var executed:Int = 0;
		
		for (i in 0...1000) {
			var isExe = timeLine.next();
			isExe.iter(function(chara):Void {
				var hasTarget = chara.pickTarget(timeLine.list);
				hasTarget.iter(function(target) {
					chara.attackTo(target);
					executed++;
				});
			});
			if (executed > 100) break;
		}
		
	}
	
}