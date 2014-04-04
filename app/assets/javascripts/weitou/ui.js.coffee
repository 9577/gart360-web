# Append 'root.' to anything you want to make global
root = exports ? this

root.lxfEndtime = ->
  $(".lxftime").each ->
    lxfday = $(this).attr("lxfday") #用来判断是否显示天数的变量
    endtime = new Date($(this).attr("endtime")).getTime() #取结束日期(毫秒值)
    nowtime = new Date().getTime() #今天的日期(毫秒值)
    youtime = endtime - nowtime #还有多久(毫秒值)
    seconds = youtime / 1000
    minutes = Math.floor(seconds / 60)
    hours = Math.floor(minutes / 60)
    days = Math.floor(hours / 24)
    CDay = days
    CHour = hours % 24
    CMinute = minutes % 60
    CSecond = Math.floor(seconds % 60) #"%"是取余运算，可以理解为60进一后取余数，然后只要余数。
    if endtime <= nowtime
      $(this).html "<p class='gq'>已过期</p>" #如果结束日期小于当前日期就提示过期啦
    else
      if $(this).attr("lxfday") is "no"
        $(this).html "<span>" + CHour + "</span>小时<span>" + CMinute + "</span>分<span>" + CSecond + "</span>秒" #输出没有天数的数据
      else
        $(this).html "<span>" + days + "</span><em>天</em><span>" + CHour + "</span><em>时</em><span>" + CMinute + "</span><em>分</em><span>" + CSecond + "</span><em>秒</em>" #输出有天数的数据

  setTimeout "lxfEndtime()", 1000