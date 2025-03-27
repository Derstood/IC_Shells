# min pulse 

## 检查
1. uncertainty是否合理
2. clock port trans设置
3. cts误用了buf?

## 修复
1. cross talk
2. 换rise fall不对称的INV
3. clock port cell VT往快换(transition减小)
4. clock port VT往慢换( require值减小 )