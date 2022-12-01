# tar1090

![Screenshot1](https://cdn.flightadsb.mengorg.cn/photos/tar1090.png)
![Alt](https://repobeats.axiom.co/api/embed/d5e8476b0519ed6080fd7005964ead7358e4c152.svg "Repobeats analytics image")

tar1090为ADS-B解码器readsb / dump1090-fa提供了改进的web界面

—改进可调历史记录

—显示所有轨道比原来的许多飞机更快

—多个地图可用

—地图可以调暗

—可选择多架飞机

—带有呼号的标签可以打开或关闭

## 无担保

有关详细信息，请参阅本页底部或许可证。

虽然努力不破坏现有的Raspbian / Debian / Ubuntu系统，但这是不能保证的。

此安装脚本为Raspbian / Debian / Ubunutu设计，在没有apt的系统上无法工作。

Tar1090不是readsb / dump1090-fa的替代品，它只是为现有的readsb或dump1090-fa安装增加了一个额外的web界面。

Dump1090-mutability应该也可以安装，但飞机细节将受到限制。

## 安装

```
sudo bash -c "$(wget -nv -O - https://gitee.com/smallmeng/tar1090-cn/raw/master/install.sh)"
```

## 查看已添加的web界面

点击下面的URL，将IP地址替换为树莓派的地址:

<http://192.168.x.yy/tar1090>

如果您对您的范围感到好奇，请尝试以下网址:

<http://192.168.x.yy/tar1090/?pTracks>

往下查看键盘快捷键。

## 更新(与安装命令相同)

```
sudo bash -c "$(wget -nv -O - https://gitee.com/smallmeng/tar1090-cn/raw/master/install.sh)"
```

配置会被保留。

## 配置第1部分:历史记录间隔和快照数量/ ptracks持续时间(可选)

编辑配置文件以更改以秒为单位的时间间隔和保存的历史文件数量:

```
sudo nano /etc/default/tar1090
```

```Ctrl-O```保存,```回车```确认,```Ctrl-X```退出

应用配置:

```
sudo systemctl restart tar1090
```

以秒为单位的历史记录的持续时间可以计算为间隔时间和历史大小。

## 配置第2部分:web界面(可选):

删除行首的 //，否则将不使用该设置。

```
sudo nano /usr/local/share/tar1090/html/config.js
```

```Ctrl-O```保存,```回车```确认,```Ctrl-X```退出
然后按```Ctrl-F5```刷新浏览器中的web界面。

如果您破坏了接口或希望恢复默认配置:

```
sudo rm /usr/local/share/tar1090/html/config.js
```
然后再次运行安装脚本。

## 家 / 收件器位置:

这是在解码器中设置的，例如readsb或dump1090-fa，如果您使用我的脚本安装他们，将有关于如何设置位置的进一步说明。

### 安装/更新以使用另一个文件夹，例如/run/combine1090

```
wget -nv -O /tmp/install.sh https://gitee.com/smallmeng/tar1090-cn/raw/master/install.sh
sudo bash /tmp/install.sh /run/combine1090
```

## 删除/卸载

```
sudo bash -c "$(wget -nv -O - https://gitee.com/smallmeng/tar1090-en/raw/master/uninstall.sh)"
```

## 使用过滤器

js 正则表达式格式，一些基础知识（关于 javascript 正则表达式语法的在线问题要广泛得多）：

- 单个'.'是一个字符的通配符
- 多个模式可以与或：“|”组合

### 一些有用的结构的例子:

#### 按照机型代码筛选:

```
波音系列:B73。(B73和第4位的任何字符)
A320系列:A32。
B737-900和B737 Max 9: B739|B39M
737系列包括max: B73.|B3.M
B737 / A320系列:B73.|.B3.M|A32.|A2.N
只有A320和B737型号:A32|B73
排除某种类型:^(?!A320)
排除多个模式:^(?!(A32.|B73.))
```

#### 按照机型描述筛选:

```
直升机:H . .
带2个喷气发动机的陆地飞机:L2J
带有任意数量活塞式发动机的陆地飞机:L.P
直升飞机的任何数量的涡轮发动机:H.T
所有涡轮螺旋桨动力的东西，包括涡轮直升机: ..T
4个引擎:.4。
2 3 4个引擎:.2.|.3.|.4。
```

## 键盘快捷键

- Q和E缩小和缩小。
- A和D向西和向东移动。
- 向西和向南移动。
- “C”或“Esc”清除选择。
- M切换多选。
- T选择所有飞机
- B切换地图亮度

## URL查询参数 (/tar1090/?icao=123456&zoom=5 and similar)

See [README-query.md](README-query.md)

## 多个实例

该脚本可以安装多个实例，首先需要编辑`/etc/default/tar1090_instances`:

在每一行必须有一个实例。

前部分为信号源的aircraft.json目录。

后部分为想要访问的网站的名称。

(网站名称例如：<http://pi/tar1090> or <http://pi/combo> or <http://pi/978>)

如果你想要使用<http://pi/>作为实例，请使用`webroot`作为名称。

主实例需要包含填写在此文件中。

示例:
```
/run/dump1090-fa tar1090
/run/combine1090 combo
/run/skyaware978 978
/run/dump1090-fa webroot
```

保存该文件后，只需运行安装脚本，它将安装/更新所有实例。

config.js还有另一个路径，用来编辑每个配置:
```
sudo nano /usr/local/share/tar1090/html/config.js
sudo nano /usr/local/share/tar1090/html-combo/config.js
sudo nano /usr/local/share/tar1090/html-978/config.js
sudo nano /usr/local/share/tar1090/html-webroot/config.js
```

网页文件夹将在以下位置:
```
/usr/local/share/tar1090/html
/usr/local/share/tar1090/html-combo
/usr/local/share/tar1090/html-978
/usr/local/share/tar1090/html-webroot
```

在此示例文件中，运行文件夹和 systemd 服务将称为 tar1090-combo 和 tar1090-978。

主实例是该规则的例外，具有系统化服务和运行目录，仅称为 tar1090。

### 删除实例

例如，删除名称为 combo 和 978 的实例：

首先删除`/etc/default/tar1090_instances`中相应的行，

然后保存该文件，以便在更新时不会再次安装它。

然后运行以下适合您的实例名称的命令，

您需要包含 tar1090-`实例名称`，该命令会自动添加到服务名称中：

```
sudo bash /usr/local/share/tar1090/uninstall.sh tar1090-combo
sudo bash /usr/local/share/tar1090/uninstall.sh tar1090-978
```

如果实例是使用旧方法安装的，而没有tar1090_instances文件，

则必须在组合之前尝试不使用 tar1090-`实例名称`，如下所示：

```
sudo bash /usr/local/share/tar1090/uninstall.sh combo
sudo bash /usr/local/share/tar1090/uninstall.sh 978
```

## lighttpd

tar1090 现在默认在：80 端口上使用 lighttpd。

## nginx 配置

如果已经安装了nginx，安装脚本会生成一个配置文件

修改配置需要进入相应的 server { }部分。

在通常的配置中，这意味着添加以下行：
```
include /usr/local/share/tar1090/nginx-tar1090.conf;
```
在serve { } 部分中的`/etc/nginx/sites-enabled/default`或`/etc/nginx/conf.d/default.conf`部分，

具体取决于您的系统配置，不要忘记重新启动 nginx 服务。

## heywhatsthat.com范围概述:

判断实际的范围(/?pTracks，见下一章)

首先需要知道接收器位置

接收1090mhz的信号需要接收器暴露在空气中

因此取决于障碍物和地球的曲率。

要获得一个位置的理论范围，请遵循本章的指导。

#### 1: 创建全景图并在`heywhatsthat`页面上查看您的范围

- 访问 <http://www.heywhatsthat.com/>

- 点击`New Panorama`

- 为你的天线精确设置位置

- 输入一个标题/提交请求并等待它完成

- 向下滚动到地图，查看地图的右上角的按钮

- 在地图上使用“up in the air”按钮，减少地图放大

- 你可以改变海拔(英尺)以下的地图，以查看不同的轮廓为您的位置

- 这些范围告诉你在相关的高度上你能从多远的地方接到飞机

- 全景图没有考虑到距离天线近100英尺的障碍物，也没有考虑树木，但会阻碍接收

#### 2: 将理论范围轮廓集成到本地 tar1090 显示器中

- 在tar1090地图上使用高度将通过更改下载URL设置

- 在靠近页面顶部的地方，有一个全景图的URL。

— 将以下命令中的XXXXXX替换为您的全景URL中包含的ID，然后在您的pi上执行命令:
```
sudo /usr/local/share/tar1090/getupintheair.sh XXXXX
```
- 您现在应该在 tar1090 地图上获得 40000 英尺飞机理论航程的航程范围

- 与 <http://192.168.x.yy/tar1090/?pTracks> 进行比较可能会很有趣，默认情况下将显示最近 8 小时的跟踪。

- 用于加载多个范围和不同实例的更多选项
```
# 加载两个范围，10000 英尺和 40000 英尺
sudo /usr/local/share/tar1090/getupintheair.sh XXXXX 3048,12192
```

## /tar1090/?pTracks

![Screenshot2](https://cdn.flightadsb.mengorg.cn/photos/screenshot4.png)

- 添加 /?pTracks 到 /tar1090 的URL, 看起来像这样: <http://192.168.x.yy/tar1090/?pTracks>
- 显示您看到的最近 8 小时的跟踪，为您的覆盖范围/范围提供很好的可视化表示
- 可以通过高度过滤器通过高度过滤
- 通过配置修改 8 小时的时间限制[configuration](#configuration-part-1-history-interval-and-number-of-snapshots--ptracks-duration-optional)
- 将显示的持续时间限制为2小时: /tar1090/?pTracks=2
- 绘制较少的点可减少显示时间（间隔越长，计算时间越短，默认值为 15）: /tar1090/?pTracks=8&pTracksInterval=60

## 无担保 - 许可证摘录:

  11. 由于程序是免费许可的，因此在适用法律允许的范围内，对程序不提供任何保证。除非另有书面说明，否则版权所有者和/或其他方“按原样”提供程序不提供任何明示或暗示的保证，包括但不限于对适销性和适用于特定用途的暗示保证。有关程序质量和性能的全部风险由您承担。如果程序被证明有缺陷，您承担所有必要的服务，维修或更正的费用。

## tar1090原作者

<https://github.com/wiedehopf>
