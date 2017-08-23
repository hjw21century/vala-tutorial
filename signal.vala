public class TestClass : GLib.Object{
	public signal void sig_1(int a);
	public static  int main(string[] args){
		TestClass t = new TestClass();
		t.sig_1.connect((t, a)=>{
			stdout.printf("%d\n",a);
		});

		t.sig_1(5);

		return 0;
	}
}