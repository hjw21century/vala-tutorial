[DBus(name = "org.example.DemoService")]
public class DemoService : Object {
    /* Private field, not exported via D-Bus */
    int counter;

    /* Public field, not exported via D-Bus */
    public int status;

    /* Public property, exported via D-Bus */
    public int something { get; set; }

    /* Public signal, exported via D-Bus
     * Can be emitted on the server side and can be connected to on the client side.
     */
    public signal void sig1();

    /* Public method, exported via D-Bus */
    public void some_method() {
        counter++;
        stdout.printf("heureka! counter = %d\n", counter);
        sig1();  // emit signal
    }

    /* Public method, exported via D-Bus and showing the sender who is
       is calling the method (not exported in the D-Bus interface) */
    public void some_method_sender(string message, GLib.BusName sender) {
        counter++;
        stdout.printf("heureka! counter = %d, '%s' message from sender %s\n",
                      counter, message, sender);
    }
}

void on_bus_aquired (DBusConnection conn) {
    try {
        // start service and register it as dbus object
        var service = new DemoService();
        conn.register_object ("/org/example/demo", service);
    } catch (IOError e) {
        stderr.printf ("Could not register service: %s\n", e.message);
    }
}

void main () {
    // try to register service name in session bus
    Bus.own_name (BusType.SESSION, "org.example.DemoService", /* name to register */
                  BusNameOwnerFlags.NONE, /* flags */
                  on_bus_aquired, /* callback function on registration succeeded */
                  () => {}, /* callback on name register succeeded */
                  () => stderr.printf ("Could not acquire name\n"));
                                                     /* callback on name lost */

    // start main loop
    new MainLoop ().run ();
}