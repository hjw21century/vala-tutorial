public class Wrapper<G> : GLib.Object {
    private G data;

    public void set_data(G data) {
        this.data = data;
    }

    public G get_data() {
        return this.data;
    }
}

int main()
{
	var wrapper = new Wrapper<string>();
	wrapper.set_data("test");
	stdout.printf("%s\r\n",wrapper.get_data());
	return 0;
}