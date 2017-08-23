void main() {

    var loop = new MainLoop();
    var time = new TimeoutSource(2000);

    time.set_callback(() => {
        stdout.printf("Time!\n");
        loop.quit();
        return false;
    });

    time.attach(loop.get_context());

    loop.run();
}