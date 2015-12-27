package util;
import haxe.ds.Option;

class OptionHelper
{

	public static function create<T>(x:T):Option<T> {
		return if (x == null) None else Some(x); 
		
	}
	
	public static function getOrElse<T>(a: Option<T>, b: T): T {
        return switch (a) {
            case Some(x): x;
            case None: b;
        }
    }
	
	public static function isEmpty<T>(opt:Option<T>) {
        return switch(opt) {
            case Some(v): false;
            case None: true;
        }
    }
	
	//値がある時にのみ関数を実行
	public static function iter<A>(opt:Option<A>, f:A -> Void) {
        switch(opt) {
            case Some(v): f(v);
            case None: 
        }
    }
	
	//値がある時、別の型のOptionに変換
	public static function map<A, B>(opt:Option<A>, f:A -> B) {
        return switch (opt) {
            case Some(v): Some(f(v));
            case None: opt;
        }
    }
	
}