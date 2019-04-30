#include <stdlib.h>
#include <stdio.h>
char decimalNumber[] = "21602";
#define numberOfDecDigits (sizeof(decimalNumber)-1)
int i; //index 
int decimal; //int form of number stored in char decimalNumber
int numHexDigits; //number of hexadecimal digits
char hexDigits[numberOfDecDigits]; 
int temp; int decDigit; int hexDigit;
char hexarray[] = "0123456789ABCDEF";

void bye()
    {
    exit(0);
    }
void getdecimalDigit()
{
 decDigit = decimalNumber[i] - '0';
 return;   
}
void gethexDigit()
{
    hexDigit = decimal % 16;  //gives position
    decimal /= 16;
    return;
}
void accumulateDecimalNumber()
{
    decimal = 0; 
    i = 0;
    adnwhileLoop:
        getdecimalDigit();
        decimal *= 10;
        decimal += decDigit; 
        if(i >= numberOfDecDigits-1) //start i =1
        {
            goto adnendwhileLoop;
        }
        i++;
        goto adnwhileLoop; 
    adnendwhileLoop:
    return;
}
void numberOfHexDigits() //calculate the number of hexdigits needed 
{
    temp = decimal;
    numHexDigits = 0;
    
    nhdwhileLoop:
    numHexDigits++;
    if(temp == 0)
    {
        goto endwhileLoop;
        
    }
    temp = temp/16;
    goto nhdwhileLoop;
    endwhileLoop:
    return;
}
void convertDectoHex()
{
    numHexDigits = 0;
    numberOfHexDigits();
    i = numHexDigits-1; 
    d2hwhileLoop:
    gethexDigit();
    hexDigits[i] = hexarray[hexDigit];
    if(i <= 0)
    {
        goto d2hendwhileloop;
    }
    i--;
    goto d2hwhileLoop;
    d2hendwhileloop:
    return; 
}

int main()
{
    accumulateDecimalNumber();
    convertDectoHex();
    bye();
    return 0;
}
