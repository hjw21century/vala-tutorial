public interface Callable : GLib.Object{
	public abstract bool answering {get;protected set;}
	public abstract void answer();
	public virtual bool hang(){
		answering = false;
		return true;
	}
}

public class Phone : GLib.Object, Callable{
	public bool answering {get; protected set;}
	public void answer(){

	}

	public static void main(){
		var f = new Phone();
		if(f.hang())
			stdout.printf("Hand done.\n");
		else
			stdout.printf("hand Error!\n");

		stdout.printf("END\n");

	} 
}