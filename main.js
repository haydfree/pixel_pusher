const memory = new WebAssembly.Memory({
  initial: 1,
  maximum: 1,
});

const { instance } = await WebAssembly.instantiateStreaming(
  fetch("wasm/main.wasm"),
  { env: { memory } }
);

const WIDTH = 256, HEIGHT = 256;
const canvas = document.getElementById("screen");
const ctx = canvas.getContext("2d");
const imageData = ctx.createImageData(WIDTH, HEIGHT);

const getFramebuffer = instance.exports.get_framebuffer;
const updateFrame = instance.exports.update_frame;

const framebufferPtr = getFramebuffer();
const heap = new Uint8ClampedArray(memory.buffer, framebufferPtr, WIDTH * HEIGHT * 4);

let frame = 0;
function render() {
  updateFrame(frame++);
  imageData.data.set(heap);
  ctx.putImageData(imageData, 0, 0);
  requestAnimationFrame(render);
}
render();

