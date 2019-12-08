package testapp;

public class Main {

    public static void main(String[] args) {
        if(args.length < 1){
            System.out.println("We need arguments!");
        }
        else if(args.length > 1){
            System.out.print("Too many arguments!");
        }

        int x = Integer.parseInt(args[0]);
        if(x > 99999){
            System.out.println("That's six figures");
        }else{
            System.out.println("That's less than six figures");
        }
    }

}