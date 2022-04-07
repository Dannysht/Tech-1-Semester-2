import implementation.ImplementRunnable;
import implementation.ImplementThread;

public class Main
{
    public static void main(String[] args)
    {
        ImplementThread implementThread = new ImplementThread();
        ImplementThread implementThread1 = new ImplementThread();

        // if i use run it won't create a thread it will just show the method
        implementThread.start();
        implementThread1.start();

        ImplementRunnable implementRunnable = new ImplementRunnable();
        implementRunnable.run();

    }
}
