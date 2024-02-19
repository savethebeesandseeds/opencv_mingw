#include <opencv2/opencv.hpp>

int main() {
    /* 1. Load an image */
    Mat image = cv::imread("example.png"); 

    /* 2. Check if image loaded successfully */
    if (image.empty()) {
        std::cerr << "Could not load image" << std::endl;
        return 1;
    }

    /* 3. Get image shape (rows, columns, channels) */
    int rows = image.rows;
    int cols = image.cols;
    int channels = image.channels();

    /* 4. Print the shape */
    std::cout << "Image Shape: (" << rows << ", " << cols << ", " << channels << ")" << std::endl;

    return 0;
}