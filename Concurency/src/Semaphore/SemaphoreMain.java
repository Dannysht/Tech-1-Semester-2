package Semaphore;

import java.util.concurrent.Semaphore;

public class SemaphoreMain
{
    public static void main(String[] args)
    {
        Semaphore semaphore = new Semaphore(1);
        SemaphoreThread semaphoreThread = new SemaphoreThread(semaphore);
        SemaphoreThread semaphoreThread1 = new SemaphoreThread(semaphore);
        SemaphoreThread semaphoreThread2 = new SemaphoreThread(semaphore);

        semaphoreThread.start();
        semaphoreThread1.start();
        semaphoreThread2.start();
    }
}
