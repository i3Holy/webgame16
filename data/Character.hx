package data;
import battle.Field;
import battle.TacticsTree;
import data.Skill.Limit;
import data.Skill.SkillType;
import data.Skill.Timing;
import data.Weapon.WeaponData;

class Character
{

	
	public var weaponList:Array<Weapon> = [];
	
	public var name:String = "";
	
	public var sex:Sex = Sex.MALE;
	
	public var wait:Float = 0;
	
	public var teamIndex:Int = 0;
	
	public var activeSkill(get, null):Skill;
	
	public var tactics:TacticsTree;
	
	public var field:Field;
	
	public var hp(get, null):Float;
	function get_hp():Float 
	{
		return mhp - damage;
	}
	
	public var mhp(get, null):Float;
	function get_mhp():Float 
	{
		return vit * 10;
	}
	public var damage:Float = 0;
	
	public function new(field:Field) 
	{
		this.field = field;
		var skill = new Skill();
		skill.limit = Limit.TIMING(Timing.ATTACK_FINISHED, Limit.SUCCESS);
		skill.type = SkillType.HEAL_CONDITION;
		skill.power = 1;
		skill.name = "";
		
	}
	
	public var skillList:Array<Skill> = [];
	
	public var str:Float = 10;
	public var vit:Float = 10;
	public var int:Float = 10;
	public var mnd:Float = 10;
	public var dex:Float = 10;
	public var agi:Float = 10;
	
	public var at(get, null):Float;
	function get_at():Float 
	{
		
		var result = str;
		if (weaponList.length > 0) {
			result += weaponList[0].at;
		}
		
		return result;
	}
	
	public var df(get, null):Float;
	function get_df():Float
	{
		return vit;
	}
	
	public var mat(get, null):Float;
	function get_mat():Float 
	{
		return mat;
	}
	
	public var mdf(get, null):Float;
	function get_mdf():Float 
	{
		return mdf;
	}
	
	function get_activeSkill():Skill 
	{
		return weaponList[0].skillList[0];
	}
	
	
	public function executeTactics():Void {
		
		
		
	}
	
	public function setData(data:CharacterData):Void {
		
		str = data.str;
		vit = data.vit;
		int = data.int;
		mnd = data.mnd;
		dex = data.dex;
		agi = data.agi;
		for (weaponData in data.weaponList) {
			var weapon = new Weapon();
			weapon.setData(weaponData);
			weaponList.push(weapon);
		}
	}
	
	public function getData():CharacterData {
		var data = createData();
		
		data.str = str;
		data.vit = vit;
		data.int = int;
		data.mnd = mnd;
		data.dex = dex;
		data.agi = agi;
		
		data.weaponList = [];
		
		return data;
		
	}
	
	public static function createData():CharacterData {
		
		var baseValue:Float = 10;
		
		var result = {
			
			str:baseValue,
			vit:baseValue,
			int:baseValue,
			mnd:baseValue,
			dex:baseValue,
			agi:baseValue,
			weaponList:[]
			
		}
		
		return result;
		
	}
	
}

typedef CharacterData = {
	
	str:Float,
	vit:Float,
	int:Float,
	mnd:Float,
	dex:Float,
	agi:Float,
	weaponList:Array<WeaponData>
	
}