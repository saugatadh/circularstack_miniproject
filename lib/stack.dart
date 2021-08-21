
 import 'package:get/get.dart';


int MAX_STACK_SIZE = 7;
class Node {
   
	    int data;
	    Node next;
}

class CircularStack extends GetxController {
    
        Node  tail;
        int counter = 0;
        CircularStack(){tail = null;}
      //Function to check wheather the  Stack is empty or not
      bool isEmpty(){
          if(tail==null){
            return true;
          }else{
            return false;
          }
      }
          
       //Function to check wheather the  Stack is full or not 

      bool isFull(){
          if (counter > MAX_STACK_SIZE)
          return true;
        else
          return false;

      }

    //Function to push element in  Stack using circular linked list

      void push( int value)
         {
            counter += 1;
            Node temp = new Node();
            temp.data = value;
              
            if (isEmpty()){
              temp.next = temp;
              tail = temp;
            }else if(isFull()){
                print("Stack is overflowed");
                counter -= 1;
            }else{
                  temp.next = tail.next;
                  tail.next = temp;
            }

	
      }

    // Function to delete element from  Stack in circular linked list
    
        int pop()
              {
              int value; // Value to be popped
              counter -= 1;
              if (isEmpty()) {
                print("Stack is empty");
                return 0;
              }

              // If this is the last node to be deleted
              
              if (tail.next == tail) {
                    value = tail.data;
                    tail = null;
                    
              }
              else // There are more than one nodes
              {
                Node temp = tail.next;
                value = temp.data;
                tail.next = temp.next;
              
              }

              return value;
            }

      int top(){
	        return tail.next.data;
    }
 
     

            // Function displaying the elements of  stack from circular linked list
     List display()
            {
                List<int> list = [];
                if(tail == null){
                        print("\nthe stack is empty");
                        return list;
                }
                  Node temp = tail.next;
              print("\nElements in Circular stack are: ");
              while (temp.next != tail.next) {
                print( temp.data);
                list.add(temp.data);
                temp = temp.next;
              }
              print(temp.data);
              list.add(temp.data);
              return list;
            }

  
}



