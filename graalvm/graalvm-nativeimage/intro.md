
GraalVM Native Image feature allows you to ahead-of-time compile Java code to a standalone executable, called a `native image`.
 This native image is an autonomous executable program containing the application classes,  dependencies classes, runtime library classes from JDK and statically linked native code from JDK. 
 It does not run on the Java VM, but includes all the  necessary components like memory management and thread scheduling from a different virtual machine, called “Substrate VM”.

In this scenario, you will learn how to build and run a native image with GraalVM.
