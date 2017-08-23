delegate void PrintIntFunc(int a);

void main() {
    PrintIntFunc p1 = (a) => { stdout.printf("%d\n", a); };
    p1(10);

    // Curly braces are optional if the body contains only one statement:
    PrintIntFunc p2 = (a) => stdout.printf("%d\n", a);
    p2(20);
}