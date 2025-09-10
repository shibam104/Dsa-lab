#include <stdio.h>
#include <stdlib.h>

// Define the structure for a tree node
struct Node {
    int data;
    struct Node *lchild;
    struct Node *rchild;
};

// Function to create a new node
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->lchild = newNode->rchild = NULL;
    return newNode;
}

// Function to insert a node into the BST
struct Node* insertNode(struct Node* root, int data) {
    if (root == NULL) {
        root = createNode(data);
        printf("Inserted %d successfully.\n", data);
        return root;
    }

    if (data < root->data) {
        root->lchild = insertNode(root->lchild, data);
    } else if (data > root->data) {
        root->rchild = insertNode(root->rchild, data);
    } else {
        printf("Duplicate data! %d is already in the tree.\n", data);
    }
    return root;
}

// In-order Traversal (Left, Root, Right)
void inorderTraversal(struct Node* root) {
    if (root != NULL) {
        inorderTraversal(root->lchild);
        printf("%d ", root->data);
        inorderTraversal(root->rchild);
    }
}

// Pre-order Traversal (Root, Left, Right)
void preorderTraversal(struct Node* root) {
    if (root != NULL) {
        printf("%d ", root->data);
        preorderTraversal(root->lchild);
        preorderTraversal(root->rchild);
    }
}

// Post-order Traversal (Left, Right, Root)
void postorderTraversal(struct Node* root) {
    if (root != NULL) {
        postorderTraversal(root->lchild);
        postorderTraversal(root->rchild);
        printf("%d ", root->data);
    }
}

// Main program
int main() {
    struct Node* root = NULL;
    int choice, data;

    printf("===== Binary Search Tree (BST) Operations =====\n");

    do {
        printf("\n1. Insert Node\n");
        printf("2. In-order Traversal\n");
        printf("3. Pre-order Traversal\n");
        printf("4. Post-order Traversal\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter data to insert: ");
                scanf("%d", &data);
                root = insertNode(root, data);
                break;

            case 2:
                printf("In-order Traversal: ");
                inorderTraversal(root);
                printf("\n");
                break;

            case 3:
                printf("Pre-order Traversal: ");
                preorderTraversal(root);
                printf("\n");
                break;

            case 4:
                printf("Post-order Traversal: ");
                postorderTraversal(root);
                printf("\n");
                break;

            case 5:
                printf("Exiting program. Thank you!\n");
                break;

            default:
                printf("Invalid choice! Please enter a valid option.\n");
        }
    } while (choice != 5);

    return 0;
}
