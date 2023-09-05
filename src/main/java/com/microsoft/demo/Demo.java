package com.microsoft.demo;

public class Demo {
    public void DoSomething(boolean flag){
        if(flag){
            System.out.println("I am safe, are you??");
            System.out.println("Hemlo!");
            return;
        }

        System.out.println("I am not safe");
    }
}
