package PrintingThreads;

public class PrintingThreadMain
{
    public static void main(String[] args)
    {
        PrintingThread printingThread = new PrintingThread("I am cool");
        printingThread.start();
    }
}
