class Foo : Object {
    public void my_method() { stdout.printf("Foo:Object\r\n");}
}

class Bar : Foo {
    public new void my_method() { stdout.printf("Bar:Foo\r\n");}
}

void main(){
	var bar = new Bar();
	bar.my_method();
	(bar as Foo).my_method();
}