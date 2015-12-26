package;

import api.react.ReactDOM;
import battle.BatleResult;
import battle.Util;
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
		var result:BatleResult = Util.createResult();
		ReactDOM.render(ColorBox.createElement( { color:"black" } ), Browser.document.getElementById("app"));
	}
	
}