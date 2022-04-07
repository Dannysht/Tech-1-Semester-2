package CountingThreads;

public class CountingThreadsMain
{


    public static void main(String[] args) throws InterruptedException
    {
        CountingThread countingThread = new CountingThread();
        CountingThread countingThread2 = new CountingThread();
        CountingThread countingThread3 = new CountingThread();

        countingThread.setPriority(Thread.MAX_PRIORITY);
        countingThread2.setPriority(Thread.NORM_PRIORITY);
        countingThread3.setPriority(Thread.MIN_PRIORITY);
        countingThread.start();
        countingThread.join();
        countingThread2.start();
        countingThread3.start();
    }
}
