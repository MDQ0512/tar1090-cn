# 查询

## 查询参数

- — 查询参数被附加到tar1090通常使用的URL。
- — 第一个查询参数前有问号?，对于每个附加参数，将加上&号。
- — 例如:<http://192.168.x.yy/tar1090/?icao=456789&enableLabels&extendedLabels=2&trackLabels&zoom=11&mapDim=0.4>
- — 有些参数需要值。如果不传递任何值，则使用默认值。
- — 部分参数不带值。如果在URL中使用，则它们是活动的。(hideButtons hideSideBar……)。
- — tar1090中的查询参数不区分大小写。

## 搜索/过滤

- icao=icao -选择并隔离所选平面。用逗号分隔倍数。
- noIsolation -显示其他飞机，而不仅仅是icao选择的飞机
- icaoFilter=hex1,hex2,hex3 -只显示提到的十六进制id，不会显示其他飞机
- reg=注册-直接链接到特定的飞机注册。用逗号分隔倍数。?icao是首选，因为这个选项需要更长的加载时间。
- filterAltMin=500 -过滤最低高度到500英尺
- filterAltMax=5000 -过滤最大高度为5000英尺
- filterCallSign=^(UAL|DAL) -过滤美联航或德尔塔的呼号
- filterType=B738 -过滤到飞机类型代码B738即737-800
- filterDescription=L2J -根据类型描述过滤飞机
- filterIcao=^a -过滤以a开头的icao
- filterSources=adsb,uat,adsr,mlat,tisb,modeS—根据源类型过滤面板。
- filterDbFlag=military,pia,ladd -根据数据库标志过滤平面。
- sortBy=column -(可能的值:icao、flag、flight、registration、aircraft_type、squawk、高度、速度、vert_rate、距离、track、msgs、seen、rssi、lat、lon、data_source、military、ws、wd
- sortByReverse—反向sortBy指定的排序

有关如何使用过滤器的更多示例，请参阅主自述

## 故障排除

- reset - reset页面设置
- showerrors -在屏幕上显示错误

## 渲染参数

- zoom=1-20 -设置缩放级别。
- enableLabels—启用飞机上的标签(“L”按钮)。
- extendedLabels=value -选择标签类型(“O”按钮)/有效值为0,1,2。
- trackLabels -启用轨道标签(“K”按钮)。
- labelsGeom -使用几何高度在轨道标签
geomEGM -显示几何高度在EGM96 (MSL)而不是WGS84(更简单的大地水准面参考)
- noVanish -持久模式(“P”键)。
- scale=0.1-x -整体接口缩放。
- iconScale=0.1-x - scale飞机图标。(规模繁殖?)
- labelScale=0.1-x - scale飞机标签。(规模繁殖?)
- tempTrails=value -显示##秒历史的临时路径。
- mapDim=0.1-1.0 -降低地图亮度(负值增加亮度)
- map对比度=0.1-1.0 -增加地图对比度(负值降低亮度)
- filterMaxRange=value -渲染轨迹的最大距离。
- baseMap=maptype -更改映射类型(在config.js中定义)。
- mapOrientation=0-360 -正常情况下真北朝上，使用这个来改变哪个真方向指向上。
— monochromeMarkers=xxxxxx—为标记设置恒定的html颜色(参数为十六进制颜色)。
- monochromeTracks=xxxxxx -为履带设置恒定的html颜色(参数为十六进制颜色)。
- outlineWidth=value -为飞机图标设置宽度(仅适用于禁用webGL的情况)
- outlineColor=xxxxxx -设置轮廓颜色(参数为十六进制颜色，仅在禁用webGL时工作)
- sidebarWidth=xxx -侧栏大小(以像素为单位)。
- hideSideBar—隐藏侧边栏。
- hideButtons -隐藏所有按钮。
- centerReceiver -控制接收器位置的视图。
- nowebgl -强制渲染没有WebGL。
- tableInView -按钮V /只显示在表中查看的飞机
- screenshot-对于自动截屏，禁用在视图中所有飞机第一次加载后更新
- SiteLat=45.0 SiteLon=10.0 -覆盖本次访问的接收器位置

## 切换

- mil -军事/有趣。
- tempTrails -启用临时飞机跟踪/跟踪。
- mobile—强制移动视图。
- desktop - force桌面视图。
- kiosk -强制kiosk模式(tempTrails=true / hideButtons=true / userScale=2)。
- allTracks -像按T一样启用跟踪

## 热点地图 / 回放(仅与readsb——heatmap参数一起可用)

- replay -所有飞机的回放历史
- heatmap -默认显示最近24小时的热图(可选:提供绘制的最大点数，默认32000)
- heatDuration -在热图中显示的小时数
- heatEnd -将热图时间窗口移到过去的时间
- heatAlpha - 0.1到1.0 -点的透明度
- heatRadius -热图的点大小
- heatManualRedraw -只在按r时重绘圆点

- realHeat -真实的热图而不是点
- heatBlur —realHeat参数
- heatWeight - realHeat参数
