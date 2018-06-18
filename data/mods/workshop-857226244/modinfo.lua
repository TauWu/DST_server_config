name = "挂机领礼包"
author = "Darling.青年"
version = "1.0.3"

description = [[
创建世界时 勾选这个mod 默认开 无敌模式
进入世界后不用任何操作,去睡觉好了.
睡醒了退出世界看你的藏品好了.一般一晚上4个礼包就都能出来.
]]

forumthread = ""

api_version = 10

dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true
all_clients_require_mod = false
client_only_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options=
{
	{
      name = "无敌模式",
      label = "无敌模式",
      options = {
        {description = "启动", data = "true"},
        {description = "关闭", data = "false"},
      },
      default = "true",
    }
}