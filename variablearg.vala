void method_with_varargs(int fixed, ...) {
    var l = va_list();
    while (true) {
        string? key = l.arg();
        if (key == null) {
            break;  // end of the list
        }
        double val = l.arg();
        stdout.printf("%s: %g\n", key, val);
    }
}

void main() {
    method_with_varargs(42, "foo", 0.75, "bar", 0.25, "baz", 0.32);
}