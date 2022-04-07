package Semaphore;

import java.util.concurrent.Semaphore;

public class SemaphoreThread extends Thread
{
    Semaphore semaphore;

    public SemaphoreThread (Semaphore semaphore)
    {
        this.semaphore = semaphore;
    }

    @Override
    public void run()
    {
        try
        {
            semaphore.acquire();
        }
        catch (InterruptedException e)
        {
            e.printStackTrace();
        }
        for( int i = 0; i <= 100; ++i)
        {
            System.out.println(i);
        }
    }
}
