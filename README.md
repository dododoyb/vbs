import java.time.Duration;
import java.time.Instant;

public class ProcessingTimeExample {
    public static void main(String[] args) {
        // 処理の開始時刻を取得
        Instant startTime = Instant.now();

        // ここに処理を記述する
        // ...

        // 処理の終了時刻を取得
        Instant endTime = Instant.now();

        // 経過時間を計算
        Duration duration = Duration.between(startTime, endTime);

        // 経過時間をhh:mm:ss形式で表示
        long hours = duration.toHours();
        long minutes = duration.toMinutesPart();
        long seconds = duration.toSecondsPart();

        System.out.printf("経過時間: %02d:%02d:%02d%n", hours, minutes, seconds);
    }
}
