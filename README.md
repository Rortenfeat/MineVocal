# MineVocal
在原版 Minecraft 中实现的简易声码器模型，可以合成单音调、单音素人声（歌声）。

## 使用

1. 安装数据包和资源包后，请在存档内初始化：
   
   ```
   function minevocal:init
   ```
   
2. 将歌声渲染使用到的参数传入储存：`minevocal:main`

   可传入的参数：
   
   | NBT 地址  | 数据类型    | 允许值（默认值）             | 意义             |
   | :-------- | ----------- | ---------------------------- | :--------------- |
   | Singer    | 字符串      | 见下文（无）                 | 选择歌手         |
   | Phone     | 字符串      | 歌手数据库中定义的音素（无） | 选择要发声的音素 |
   | Note      | 字符串/整数 | "C3".."C6" 或 48..84（60）   | 基频音高         |
   | Volume    | 整数        | 1..100（100）                | 音量             |
   | Gender    | 整数        | -72..72（0）                 | 性别因素         |
   | Roughness | 整数        | -100..100（0）               | 清浊音比例       |
   
   数据包中内置的歌手是 `"lty"` 和 `"miku"`，她们都包含五个音素 `"a","e","i","o","u"`。
   
   `Note` 允许音名或 MIDI 格式输入。音名格式示例：`"A4","F#5","Cb6"`。
   
   `Roughness` 控制正弦波与噪音的比例。越低正弦波比例越大（声音会越机械），越高噪音比例越大（会导致越多气声）。经过尝试，将此值设置为 20..30 时合成效果最真实。
   
   `Gender` 控制性别因素。越低越偏向女声，越高越偏向男声。不建议将此值设定得过低或过高。
   
3. 渲染并播放：

   ```
   function minevocal:render
   ```

   如果想要自定义声源和收听到声音的玩家，请给声源实体 `mv.spe` 标签， 给听者 `mv.lis` 标签。

   没有上述标签时，默认给执行者 `mv.spe` 标签，给全体玩家 `mv.lis` 标签。

   声音将播放到 声音/语音 通道，请确保选项中开启此项音量。

4. 手动停止声音：

   ```
   function minevocal:stop
   ```

   卸载：
   
   ```
   function minevocal:uninstall
   ```

## 示例

```
# 初始化 默认关闭缓存模式
function minevocal:init
# 设置歌手为 lty
data modify storage minevocal:main Singer set value 'lty'
# 设置音素为 a
data modify storage minevocal:main Phone set value 'a'
data modify storage minevocal:main Note set value 'G4'
data modify storage minevocal:main Roughness set value 25
data modify storage minevocal:main Volume set value 100
data modify storage minevocal:main Gender set value 0
function minevocal:render
```

```
# 启用缓存模式
function minevocal:cache/on
data modify storage minevocal:main Singer set value 'miku'
data modify storage minevocal:main Phone set value 'u'
# 其它参数默认，渲染音列到缓存
function minevocal:render
# 播放
function minevocal:play
```

## 原理

- https://github.com/mmorise/World WORLD 语音分析与合成系统

- https://zhuanlan.zhihu.com/p/388667328 WORLD 声码器解析

> WORLD的输入是每一帧的**基频（F0）**、**频谱包络（spectral envelope）**和**非周期比值（aperiodicity）**。

鉴于原版 Minecraft 声音播放的限制，本数据包使用 72 平均律内音阶拟合泛音列，通过各音高处对应的平均功率和平均非周期比值（使用 World 的 Python 包装器 [PyWorld](https://github.com/JeremyCCHsu/Python-Wrapper-for-World-Vocoder) 分析记录），播放相应音量的正弦波和噪音，得到粗略还原的频率响应。

| [![xiLmFK.png](https://s1.ax1x.com/2022/09/21/xiLmFK.png)](https://imgse.com/i/xiLmFK) | [![xiLZo6.png](https://s1.ax1x.com/2022/09/21/xiLZo6.png)](https://imgse.com/i/xiLZo6) |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| 原始音频（合成自 VOCALOID）的波形和频谱                      | MineVocal 合成的波形和频谱（部分高次谐波由 Minecraft 采样精度导致） |

## 自定义歌手、音素

不完善的说明：请参考库中 analyze.py 脚本。在目录下新建 samples/`歌手名`/`音素` 文件夹，在其中放入干净的采样音频（wav 格式，放入多个不同音高的采样以进行多音阶采样）。在 analyze.py 中加入 `歌手名` 到 singers 列表变量后运行。脚本将自动分析并添加该歌手、音素到数据包。如需使之可用还要到数据包的 singers.json 函数标签下添加生成的 reg.mcfunction 函数。

## 历史

- v1.0
  - 添加多音阶采样支持
  - 优化音量穷举
- v0.4
  - 重写噪音合成逻辑，大幅提升合成效果
  - 优化文件大小
- v0.3
  - 36 平均律 => 72 平均律
  - 32 次谐波 => 64 次谐波
  - 剔除不会被播放的音，优化文件大小
  - 修复噪音不播放的 bug
- v0.2
  - 用 36 平均律代替了原来的 12 平均律，较为完美地贴合了 32 次以内的谐波
  - 改进了 playsound 穷举结构（类多叉树），大大降低单次渲染的命令数（大大增加数据包大小）
  - 减小资源包大小
  - 修复音名 bug
- v0.1
  - 第一次发布
