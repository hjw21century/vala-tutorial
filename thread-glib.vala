class MyThread {

    private string name;
    private int count = 0;

    public MyThread (string name) {
        this.name = name;
    }

    public void* thread_func () {
        while (true) {
            stdout.printf ("%s: %i\n", this.name, this.count);
            this.count++;
            Thread.usleep (Random.int_range (0, 200000));
        }
    }
}

int main () {
    if (!Thread.supported ()) {
        stderr.printf ("Cannot run without thread support.\n");
        return 1;
    }

    var thread_a_data = new MyThread ("A");
    var thread_b_data = new MyThread ("B");

    try {
        // Start two threads
        /* With error handling */
        Thread<void*> thread_a = new Thread<void*>.try ("thread_a", thread_a_data.thread_func);
        /* Without error handling (is not using the try/catch) */
        Thread<void*> thread_b = new Thread<void*> ("thread_b", thread_b_data.thread_func);

        // Wait for threads to finish (this will never happen in our case, but anyway)
        thread_a.join ();
        thread_b.join ();

    } catch (Error e) {
        stderr.printf ("%s\n", e.message);
        return 1;
    }


    return 0;
}