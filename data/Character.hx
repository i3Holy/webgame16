package data;

class Character
{

	
	private var weaponList:Array<Weapon> = [];
	
	public var name:String = "";
	
	public var sex:Sex = Sex.MALE;
	
	
	
	public function new() 
	{
		
	}
	
	public var str:Float = 10;
	public var vit:Float = 10;
	public var int:Float = 10;
	public var mnd:Float = 10;
	public var dex:Float = 10;
	public var agi:Float = 10;
	
	function get_at():Float 
	{
		
		var result = str;
		if (weaponList.length > 0) {
			result += weaponList[0].at;
		}
		
		return result;
	}
	
	function get_df():Float
	{
		return vit;
	}
	
	function get_mat():Float 
	{
		return mat;
	}
	
	function get_mdf():Float 
	{
		return mdf;
	}
	
	public var at(get, null):Float;
	
	public var df(get, null):Float;
	
	public var mat(get, null):Float;
	
	public var mdf(get, null):Float;
	
	
}