function sysnotice(c) {
    var d = dialog({
        width: '400px',
        title: '提示',
        content: '<center style="font-family: Helvetica, \'Hiragino Sans GB\', \'Microsoft Yahei\', \'微软雅黑\',Arial, sans-serif;"><p style="text-align:left;">' + c + '</p></center>',
        okValue: '确定',
        ok: function() {
            this.close().remove();
            return false;
        }
    });
    d.showModal();
}