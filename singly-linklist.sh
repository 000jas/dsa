#include <stdio.h>
#include <stdlib.h>

// Node structure
struct node {
    int data;
    struct node *next;
};

struct node *head = NULL;

// Insert at beginning
void insert_begin(int item) {
    struct node *newnode;
    newnode = (struct node *)malloc(sizeof(struct node));

    newnode->data = item;
    newnode->next = head;
    head = newnode;

    printf("Element inserted at beginning\n");
}

// Insert at end
void insert_end(int item) {
    struct node *newnode, *temp;
    newnode = (struct node *)malloc(sizeof(struct node));

    newnode->data = item;
    newnode->next = NULL;

    if (head == NULL) {
        head = newnode;
    } else {
        temp = head;
        while (temp->next != NULL)
            temp = temp->next;
        temp->next = newnode;
    }

    printf("Element inserted at end\n");
}

// Delete from beginning
void delete_begin() {
    struct node *temp;

    if (head == NULL) {
        printf("List is empty\n");
    } else {
        temp = head;
        head = head->next;
        printf("Deleted element: %d\n", temp->data);
        free(temp);
    }
}

// Display linked list
void display() {
    struct node *temp;

    if (head == NULL) {
        printf("List is empty\n");
    } else {
        printf("Linked list elements:\n");
        temp = head;
        while (temp != NULL) {
            printf("%d -> ", temp->data);
            temp = temp->next;
        }
        printf("NULL\n");
    }
}

int main() {
    int choice, item;

    while (1) {
        printf("\n1. Insert at beginning\n2. Insert at end\n3. Delete from beginning\n4. Display\n5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter element: ");
                scanf("%d", &item);
                insert_begin(item);
                break;

            case 2:
                printf("Enter element: ");
                scanf("%d", &item);
                insert_end(item);
                break;

            case 3:
                delete_begin();
                break;

            case 4:
                display();
                break;

            case 5:
                return 0;

            default:
                printf("Invalid choice\n");
        }
    }
}
