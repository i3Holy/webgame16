package;

import api.react.ReactDOM;
import battle.BattleResult;
import battle.Util;
import data.Character;
import js.Browser;
import js.Lib;
import ui.ColorBox;
using api.react.React;
using battle.Calculator;

class Main 
{
	
	static function main() 
	{
		Browser.window.onload = init;
	}
	
	public static function init() 
	{
		var result:BattleResult = Util.createResult();
		ReactDOM.render(ColorBox.createElement( { color:"black" } ), Browser.document.getElementById("app"));
		
		var chara:Character = new Character();
		
		chara.attackTo(chara);
		
	}
	
}