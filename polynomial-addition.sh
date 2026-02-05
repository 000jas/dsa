#include <stdio.h>
#include <stdlib.h>

struct node {
    int coeff;
    int expo;
    struct node *next;
};

struct node *create(struct node *head) {
    int n, c, e;
    struct node *temp, *newnode;

    printf("Enter number of terms: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        newnode = (struct node *)malloc(sizeof(struct node));
        printf("Enter coefficient and exponent: ");
        scanf("%d %d", &c, &e);

        newnode->coeff = c;
        newnode->expo = e;
        newnode->next = NULL;

        if (head == NULL)
            head = newnode;
        else {
            temp = head;
            while (temp->next != NULL)
                temp = temp->next;
            temp->next = newnode;
        }
    }
    return head;
}

void display(struct node *head) {
    while (head != NULL) {
        printf("%dx^%d", head->coeff, head->expo);
        head = head->next;
        if (head != NULL)
            printf(" + ");
    }
    printf("\n");
}

struct node *add(struct node *p1, struct node *p2) {
    struct node *result = NULL, *temp, *newnode;

    while (p1 != NULL && p2 != NULL) {
        newnode = (struct node *)malloc(sizeof(struct node));

        if (p1->expo == p2->expo) {
            newnode->coeff = p1->coeff + p2->coeff;
            newnode->expo = p1->expo;
            p1 = p1->next;
            p2 = p2->next;
        }
        else if (p1->expo > p2->expo) {
            newnode->coeff = p1->coeff;
            newnode->expo = p1->expo;
            p1 = p1->next;
        }
        else {
            newnode->coeff = p2->coeff;
            newnode->expo = p2->expo;
            p2 = p2->next;
        }

        newnode->next = NULL;

        if (result == NULL)
            result = newnode;
        else {
            temp = result;
            while (temp->next != NULL)
                temp = temp->next;
            temp->next = newnode;
        }
    }

    while (p1 != NULL) {
        newnode = (struct node *)malloc(sizeof(struct node));
        newnode->coeff = p1->coeff;
        newnode->expo = p1->expo;
        newnode->next = NULL;

        temp = result;
        while (temp->next != NULL)
            temp = temp->next;
        temp->next = newnode;

        p1 = p1->next;
    }

    while (p2 != NULL) {
        newnode = (struct node *)malloc(sizeof(struct node));
        newnode->coeff = p2->coeff;
        newnode->expo = p2->expo;
        newnode->next = NULL;

        temp = result;
        while (temp->next != NULL)
            temp = temp->next;
        temp->next = newnode;

        p2 = p2->next;
    }

    return result;
}

int main() {
    struct node *p1 = NULL, *p2 = NULL, *p3 = NULL;

    printf("Create first polynomial\n");
    p1 = create(p1);

    printf("Create second polynomial\n");
    p2 = create(p2);

    printf("\nFirst Polynomial: ");
    display(p1);

    printf("Second Polynomial: ");
    display(p2);

    p3 = add(p1, p2);

    printf("Resultant Polynomial: ");
    display(p3);

    return 0;
}
