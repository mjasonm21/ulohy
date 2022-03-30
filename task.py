#Class for the Task
class Task:
    __Count = 0
    #Set value to Constructor
    def __init__(self, number):
        self.__Count = number
    #function to write correct text   
    def __ChooseOptionTest(self,number):
        if number % 5  == 0 and number % 3 == 0:        
            print("Testing")
        elif number % 5 == 0 :
            print("Agile")
        elif number % 3 == 0:
            print("Software")

        else:
            print(number)
    #loop function in that range
    def Test(self):
        for i in range(self.__Count,0,-1):
            self.__ChooseOptionTest(i)
#main function of program
def main():
    number = input()
    try:
        number = int(number)
    except:
        print("You must write whole number")
        return
    task = Task(number)    
    task.Test() 
if __name__ == "__main__":
    main()
        

    
