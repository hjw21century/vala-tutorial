public errordomain ErrorType1{
	CODE_1A
}

public errordomain ErrorType2{
	CODE_2A,
	CODE_2B
}

public class Test : GLib.Object {
    public static void thrower() throws ErrorType1, ErrorType2 {
        throw new ErrorType2.CODE_2A("Error");
    }

    public static void catcher() throws ErrorType2 {
        try {
            thrower();
        } catch (ErrorType1 e) {
            // Deal with ErrorType1
        } finally {
            // Tidy up
        }
    }

    public static int main(string[] args) {
        try {
            catcher();
        } catch (ErrorType2 e) {
            stdout.printf("ErrorType2\r\n");
            if (e is ErrorType2.CODE_2B) {
                // Deal with this code
                stdout.printf("ErrorType2.CODE_2B\r\n");
            }
        }
        return 0;
    }
}