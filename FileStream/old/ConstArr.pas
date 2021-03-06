unit ConstArr;

interface


const
  BufferMaxSize = 32768;
  BufferMax = BufferMaxSize - 1;
  FLAG_Copied = $80;
  FLAG_Compress = $40;

type
  BufferIndex = 0..BufferMax + 15;
  BufferSize = 0..BufferMaxSize;
{ extra bytes needed here if compression fails     -- dh --}
  BufferArray = array[BufferIndex] of Byte;
  BufferPtr = ^BufferArray;

implementation

end.
