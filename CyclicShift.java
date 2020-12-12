/*
A large binary number is represented by a string A of size N and comprises of 0 and 1. You must perform a cyclic shift on this string. The cyclic shift operation is defined as follows:

If the string A is [A0, A1, A2...,AN-1], then after performing one cyclic shift, the string becomes [A1, A2...,AN-1, A0].
You performed the shift infinite number of times and each time you recorded the value of the binary number represented by the string. The maximum binary number formed after performing (possibly ) the operation is B. Your task is to determine the number of cyclic shifts that can be performed such that the value represented by the string A will be equal to B for the Kth time.
*/
import java.util.*;
import java.math.BigInteger;

class TestClass {
    public static void main(String args[] ) throws Exception {
        Scanner scanner = new Scanner(System.in);
        int noOfTestCases = Integer.parseInt(scanner.nextLine());
        for(int i = 0; i < noOfTestCases; i++){
            Input input = new Input();
            input.read(scanner);

            String max = input.binaryNumber;
            int occurances = 0;
            int moves = 0;
            ArrayList<Integer> movesForOccurance = new ArrayList<Integer>();

            while(input.length > moves){
                int comparison = input.binaryNumber.compareTo(max);
                if(comparison == 1){
                    max = input.binaryNumber;
                    occurances = 1;
                    movesForOccurance.clear();
                    movesForOccurance.add(moves);
                }else if(comparison == 0){
                    occurances += 1;
                    movesForOccurance.add(moves);
                }
                input.binaryNumber = input.binaryNumber.substring(1, input.length) + input.binaryNumber.charAt(0);
                moves += 1;
            }


            BigInteger totalMoves;

            if(input.isOccuranceYetToCome(occurances)){
                BigInteger a = input.occurance.divide(BigInteger.valueOf(occurances));
                totalMoves = a.multiply(BigInteger.valueOf(input.length));
                int remaining = input.occurance.mod(BigInteger.valueOf(occurances)).intValue();
                if(remaining == 0){
                    totalMoves = totalMoves.subtract(BigInteger.valueOf(input.length - movesForOccurance.get(occurances - 1)));
                }else{
                    totalMoves = totalMoves.add(BigInteger.valueOf(movesForOccurance.get(remaining - 1)));
                }
            }else{
                totalMoves = BigInteger.valueOf(movesForOccurance.get(input.occurance.intValue()));
            }

            System.out.println(totalMoves);
        }

    }
}


class Input {

    int length;
    BigInteger occurance;
    String binaryNumber;

    public void read(Scanner scanner){
        String str = scanner.nextLine();
        String[] arr = str.split(" ");
        length = Integer.parseInt(arr[0]);
        occurance = new BigInteger(arr[1]);
        binaryNumber = scanner.nextLine();
    }

    public boolean isNotEqualToOccurance(int another){
        return occurance.compareTo(BigInteger.valueOf(another)) != 0 ;
    }

    public boolean isOccuranceYetToCome(int another){
        return occurance.compareTo(BigInteger.valueOf(another)) == 1;
    }
}
