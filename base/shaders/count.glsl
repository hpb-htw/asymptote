#ifdef GPUCOMPRESS
layout(binding=1, std430) buffer indexBuffer
#else
layout(binding=2, std430) buffer countBuffer
#endif
{
  uint index[];
};

uniform uint width;

void main()
{
  atomicAdd(index[uint(gl_FragCoord.y)*width+uint(gl_FragCoord.x)],1u);
  discard;
}
