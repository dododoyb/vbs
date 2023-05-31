package b.global;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TimerStorage {
	private static TimerStorage instance;
	private Map<String, List<ProcTimer>> storage;

	private TimerStorage() {
		storage = new HashMap<String, List<ProcTimer>>();
	}

	public static TimerStorage getInstance() {
		if (instance == null) {
			instance = new TimerStorage();
		}
		return instance;
	}

	public void newTimerTask(String taskName) {
		storage.put(taskName, new ArrayList<ProcTimer>());
	}

	public void start(String taskName) {
		ProcTimer p = new ProcTimer();
		p.setStart(LocalDateTime.now());
		storage.get(taskName).add(p);
	}

	public void end(String taskName) {
		List<ProcTimer> porcTimes = storage.get(taskName);
		porcTimes.get(porcTimes.size() - 1).setEnd(LocalDateTime.now());
	}

	public void printTimerReport() {

		for (Map.Entry<String, List<ProcTimer>> entry : storage.entrySet()) {
			String taskName = entry.getKey();
			List<ProcTimer> procTimers = entry.getValue();
			System.out.println("---" + taskName + "---");
			for (ProcTimer procTimer : procTimers) {
				System.out.println(procTimer.getStart());
				System.out.println(procTimer.getEnd());
				System.out.println(getHms(procTimer));
				System.out.println();
			}
		}

	}

	private String getHms(ProcTimer procTime) {
		Duration duration = Duration.between(procTime.getStart(), procTime.getEnd());
		long h = duration.toHours();
		long m = duration.toMinutes();
		long s = duration.toMillis();

		return String.format("%02d:%02d:%02d:%n", h, m, s);
	}

    public static LocalTime addTimes(String... times) {
        LocalTime total = LocalTime.MIN;

        for (String time : times) {
            LocalTime parsedTime = LocalTime.parse(time);
            total = total.plusHours(parsedTime.getHour())
                    .plusMinutes(parsedTime.getMinute())
                    .plusSeconds(parsedTime.getSecond());
        }

        return total;
    }
}
