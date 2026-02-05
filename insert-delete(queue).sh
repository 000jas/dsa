#include <stdio.h>
#define MAX 10

int queue[MAX];
int front = -1, rear = -1;

// Function to insert element (Enqueue)
void insert(int item) {
    if (rear == MAX - 1) {
        printf("Queue Overflow\n");
    }
    else {
        if (front == -1)
            front = 0;
        queue[++rear] = item;
        printf("Element inserted\n");
    }
}

// Function to delete element (Dequeue)
void delete() {
    if (front == -1 || front > rear) {
        printf("Queue Underflow\n");
    }
    else {
        printf("Deleted element: %d\n", queue[front++]);
    }
}

// Function to display queue
void display() {
    if (front == -1 || front > rear) {
        printf("Queue is empty\n");
    }
    else {
        printf("Queue elements:\n");
        for (int i = front; i <= rear; i++) {
            printf("%d ", queue[i]);
        }
        printf("\n");
    }
}

int main() {
    int choice, item;

    while (1) {
        printf("\n1. Insert\n2. Delete\n3. Display\n4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter element to insert: ");
                scanf("%d", &item);
                insert(item);
                break;

            case 2:
                delete();
                break;

            case 3:
                display();
                break;

            case 4:
                return 0;

            default:
                printf("Invalid choice\n");
        }
    }
}
