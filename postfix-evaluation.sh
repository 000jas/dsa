#include <stdio.h>
#include <ctype.h>

int main() {
    char postfix[50];
    int stack[50];
    int top = -1;
    int i, op1, op2, result;

    printf("Enter postfix expression: ");
    scanf("%s", postfix);

    for (i = 0; postfix[i] != '\0'; i++) {

        // If operand, push to stack
        if (isdigit(postfix[i])) {
            stack[++top] = postfix[i] - '0';
        }

        // If operator
        else {
            op2 = stack[top--];
            op1 = stack[top--];

            switch (postfix[i]) {
                case '+':
                    result = op1 + op2;
                    break;
                case '-':
                    result = op1 - op2;
                    break;
                case '*':
                    result = op1 * op2;
                    break;
                case '/':
                    result = op1 / op2;
                    break;
            }
            stack[++top] = result;
        }
    }

    printf("Result = %d", stack[top]);
    return 0;
}
