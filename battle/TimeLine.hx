package battle;
import data.Character;
import haxe.ds.Option;

class TimeLine
{

	public var list:Array<Character> = [];
	
	public function new() 
	{
		
	}
	
	public function next():Option<Character> {
		var maxWait:Float = 0;
		
		for (chara in list) {
			if (chara.wait > maxWait) maxWait = chara.wait;
		}
		
		if (maxWait < 500) {
			for (chara in list) {
				chara.wait += chara.agi;
				if (chara.wait > maxWait) maxWait = chara.wait;
			}
		}
		
		if (maxWait >= 500) {
			list.sort(function(a:Character, b:Character):Int {
				return Std.int(b.wait - a.wait);
			});
			list[0].wait -= 500;
			return Some(list[0]);
		}
		
		return None;
		
	}
	
}