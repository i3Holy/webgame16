package;

import api.react.ReactDOM;
import battle.BattleResult;
import battle.Field;
import battle.Util;
import data.Character;
import js.Browser;
import js.Lib;
import ui.ColorBox;
using api.react.React;

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
		
		var field = new Field();
		var chara:Character = new Character(field);
		
		
	}
	
}