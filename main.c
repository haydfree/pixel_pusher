#define WIDTH 256
#define HEIGHT 256

extern void* memory;
unsigned char framebuffer[WIDTH * HEIGHT * 4];

__attribute__((export_name("get_framebuffer")))
unsigned char* get_framebuffer() {
    return framebuffer;
}

__attribute__((export_name("update_frame")))
void update_frame(int frame) {
    for (int y = 0; y < HEIGHT; ++y) {
        for (int x = 0; x < WIDTH; ++x) {
            int i = (y * WIDTH + x) * 4;
            framebuffer[i + 0] = (x + frame) % 256;
            framebuffer[i + 1] = (y + frame) % 256;
            framebuffer[i + 2] = (x ^ y ^ frame) % 256;
            framebuffer[i + 3] = 255;
        }
    }
}

