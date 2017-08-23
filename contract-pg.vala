double method_name(int x, double d)
		requires (x > 0 && x < 10)
		requires (d > 0.0 && d <= 1.0)
		ensures (result >= 0.0 && result <10.0){
		return x * d;
}

int main()
{
	stdout.printf("0.8*7 = %lf\r\n",method_name(7,0.8));
	stdout.printf("0.8*11 = %lf\r\n",method_name(11,0.8));
	return 0;
}
