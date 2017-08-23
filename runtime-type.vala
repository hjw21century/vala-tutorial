class Foo : GLib.Object{
	private int id;
	public Foo(){
		id = 1;
	}
}

int main()
{
	Foo obj;
	bool b = obj is int;
	stdout.printf("%s\r\n",b?"true":"false");
	Type type = typeof(Foo);
	Foo foo = (Foo)Object.new(type);
	stdout.printf("%s\r\n",foo.get_type().name());
	return 0;
}