package b.global;

public class Main {

	public static void main(String[] args) {
		TimerStorage.getInstance().newTimerTask("main proc");
		TimerStorage.getInstance().newTimerTask("sub1");
		TimerStorage.getInstance().newTimerTask("sub2");

		TimerStorage.getInstance().start("main proc");
		
		// sub1の1回目
		TimerStorage.getInstance().start("sub1");
		sub(1);
		TimerStorage.getInstance().end("sub1");

		TimerStorage.getInstance().start("sub1");
		// sub1の2回目
		sub(2);
		TimerStorage.getInstance().end("sub1");

		TimerStorage.getInstance().start("sub2");
		// sub2の1回目
		sub(1);
		TimerStorage.getInstance().end("sub2");

		TimerStorage.getInstance().start("sub2");
		// sub2の2回目
		sub(2);
		TimerStorage.getInstance().end("sub2");

		TimerStorage.getInstance().start("sub2");
		// sub2の3回目
		sub(3);
		TimerStorage.getInstance().end("sub2");

//		TimerStorage.getInstance().end("main proc");
		TimerStorage.getInstance().printTimerReport();

		
	}

	static void sub(int seconds) {
		try {
			Thread.sleep(seconds * 1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
