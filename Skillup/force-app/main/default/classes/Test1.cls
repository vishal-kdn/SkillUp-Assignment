public class Test1 {
   Integer myInteger = 10;
   
   public void myMethod (Integer multiplier) {
      Integer multiplicationResult;
      multiplicationResult = multiplier*myInteger;
      System.debug('Multiplication is '+multiplicationResult);
   }
}