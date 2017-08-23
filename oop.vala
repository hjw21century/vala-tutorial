public class TestClass : GLib.Object{
	public int first_data = 0;
	private int second_data;

	public TestClass(){
		this.second_data = 5;
	}	

	public int method_1(){
		stdout.printf("Private data: %d", this.second_data);
		return this.second_data;
	}
}

void main() {
	TestClass t = new TestClass();
	t.first_data = 5;
	t.method_1();
}