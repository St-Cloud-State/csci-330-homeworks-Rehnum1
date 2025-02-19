#include <iostream>
#include <stack>
#include <vector>

using namespace std;

// Partition function (Lomuto Partition Scheme)
int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high];  // Choose last element as pivot
    int i = low - 1;  // Index of smaller element

    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);  // Place pivot correctly
    return i + 1;
}

// Iterative QuickSort using a stack
void quickSort(vector<int>& arr) {
    stack<pair<int, int>> stk;
    stk.push({0, arr.size() - 1});

    while (!stk.empty()) {
        int low = stk.top().first;
        int high = stk.top().second;
        stk.pop();

        if (low < high) {
            int pivotIndex = partition(arr, low, high);

            // Push left and right partitions onto the stack
            if (pivotIndex - 1 > low) {
                stk.push({low, pivotIndex - 1});
            }
            if (pivotIndex + 1 < high) {
                stk.push({pivotIndex + 1, high});
            }
        }
    }
}

// Test function
int main() {
    vector<int> arr = {10, 7, 8, 9, 1, 5};

    cout << "Unsorted array: ";
    for (int num : arr) cout << num << " ";
    cout << endl;

    quickSort(arr);

    cout << "Sorted array: ";
    for (int num : arr) cout << num << " ";
    cout << endl;

    return 0;
}