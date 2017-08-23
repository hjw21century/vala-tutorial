struct Color{
	public uint32 argb;
	public Color(){
		argb = 0x12345678;
	} 
}

class Shape: GLib.Object{
	public Color c{get; set; default = Color(); }
}

int main()
{
	Color? c = null;
	Shape s = new Shape();
	s.get("c", out c);
	stdout.printf("%zu\r\n",c.argb);
	return 0;
}