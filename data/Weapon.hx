package data;


class Weapon
{

	public function new() 
	{
		
	}
	
	public var at:Float = 10;
	
	public var skillList:Array<Skill> = [];
	
	public function setData(data:WeaponData):Void {
		at = data.at;
	}
	
	public function getData():WeaponData {
		var data = createData();
		data.at = at;
		return data;
	}
	
	public static function createData():WeaponData {
		var defaultValue:Float = 100;
		var result = {
			at:defaultValue
		}
		return result;
	}
	
}


typedef WeaponData = {
	at:Float
}