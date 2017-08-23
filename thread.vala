void* thread_func(){
	stdout.printf("thread running\r\n");
	return null;
}

int main(string[] args){
	if(!Thread.supported()){
		stderr.printf("can not run without thread!\r\n");
		return 1;
	}
	try{
		unowned Thread<void*> thread_a = Thread.create<void*> (thread_func, true);
		thread_a.join();
	}catch(ThreadError e){
		return 1;
	}
	return 0;
}