package Clock;

public class ClockMain
{
    public static void main(String[] args)
    {
        ClockThread thread1 = new ClockThread();
        thread1.setName("Clock 1");
        ClockThread thread2 = new ClockThread();
        thread2.setName("Clock 2");

        thread1.start();
        thread2.start();
    }
}
