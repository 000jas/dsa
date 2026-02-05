#linear search using c
-----------------------
#include <stdio.h>
int linearSearch(int* arr, int n, int key){
 for (int i = 0; i < n; i++) {
    if (arr[i] == key) {
            return i;
        }
    }
     return -1;
 }


int main() {

    int arr[] = { 10, 50, 30, 70, 80, 60, 20, 90, 40 };
    int n = sizeof(arr);
    int key = 30;
    
    int i = linearSearch(arr, n, key);

    if (i == -1)
        printf("Key Not Found");
    else
        printf("Key Found at Index: %d", i);

    return 0;
}   
-----------------------
#binary search using c
-----------------------

#include <stdio.h>
int binarySearch(int arr[], int n, int x) {
    int low = 0;
    int high = n-1;
    while (low <= high) {
        int mid = low + (high - low) / 2;

        if (arr[mid] == x){
            return mid;
        }
        if (arr[mid] < x){
            low = mid + 1;
        }
        else{
            high = mid - 1;
        }
    }
    
    return -1;
}

int main() {
    int arr[] = { 2, 3, 4, 10, 40 };
    int x = 10;
    int n = sizeof(arr);
    int result = binarySearch(arr, n, x);
    if(result == -1){
        printf("Element is not present in array");
    }
    else {
        printf("Element is present at index %d",result);
    }