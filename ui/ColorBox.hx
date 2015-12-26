package ui;
import api.react.React;
import api.react.ReactComponent;
import api.react.ReactComponent.ReactComponentOfProps;


class ColorBox extends ReactComponentOfProps<ColorBoxProps>
{

	public function new(props:ColorBoxProps) 
	{
		state = props;
		super();
	}
	
	override public function render():ReactComponent 
	{
		
		switch(state.color) {
			case "black":
				return React.createElement('div', { className: "colorBox", id:"black", onClick:onClick } );
				
			default:
				return React.createElement('div', { className: "colorBox", id:"white", onClick:onClick } );
				
		}
		
	}
	
	private function onClick():Void {
		switch(state.color) {
			case "black":
				setState( { color:"white" } );
			default:
				setState( { color:"black" } );
		}
		
	}
	
}

typedef ColorBoxProps = {
	color:String
}