#include <stdio.h>
#include <stdlib.h>

// Structure of a tree node
struct node {
    int data;
    struct node *left;
    struct node *right;
};

// Create new node
struct node* createNode(int item) {
    struct node* newnode;
    newnode = (struct node*)malloc(sizeof(struct node));

    newnode->data = item;
    newnode->left = NULL;
    newnode->right = NULL;

    return newnode;
}

// Preorder Traversal (Root Left Right)
void preorder(struct node* root) {
    if (root != NULL) {
        printf("%d ", root->data);
        preorder(root->left);
        preorder(root->right);
    }
}

// Inorder Traversal (Left Root Right)
void inorder(struct node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

// Postorder Traversal (Left Right Root)
void postorder(struct node* root) {
    if (root != NULL) {
        postorder(root->left);
        postorder(root->right);
        printf("%d ", root->data);
    }
}

int main() {
    /*
            1
           / \
          2   3
         / \
        4   5
    */

    struct node* root = createNode(1);
    root->left = createNode(2);
    root->right = createNode(3);
    root->left->left = createNode(4);
    root->left->right = createNode(5);

    printf("Preorder Traversal: ");
    preorder(root);

    printf("\nInorder Traversal: ");
    inorder(root);

    printf("\nPostorder Traversal: ");
    postorder(root);

    return 0;
}
