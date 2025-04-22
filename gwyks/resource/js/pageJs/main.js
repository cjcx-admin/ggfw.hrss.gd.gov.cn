function alert(c) {
    var d = dialog({
        width: '200px',
        title: '提示',
        content: '<center style="font-family: Helvetica, \'Hiragino Sans GB\', \'Microsoft Yahei\', \'微软雅黑\',Arial, sans-serif;">' + c + '</center>',
        okValue: '确定',
        ok: function() {
            this.close().remove();
            return false;
        }
    });
    d.showModal();
}

function alert(c, okf) {
    var d = dialog({
        width: '200px',
        title: '提示',
        content: '<center style="font-family: Helvetica, \'Hiragino Sans GB\', \'Microsoft Yahei\', \'微软雅黑\',Arial, sans-serif;">' + c + '</center>',
        okValue: '确定',
        ok: function() {
            if (typeof(okf) == 'function') {
                okf();
            }
            this.close().remove();
            return false;
        }
    });
    d.showModal();
}

function confirm(c, okf) {
    var d = dialog({
        title: '提示',
        content: c,
        okValue: '确定',
        ok: function() {
            this.close().remove();
            if (typeof(okf) == 'function') {
                okf();
            }
        },
        cancelValue: '取消',
        cancel: function() {
            this.close().remove();
        }
    });
    d.showModal();
}

function illegalNotice(t, c, okf) {
    var d = dialog({
        title: t || '提示',
        content: c,
        height: '400px',
        width: '500px',
        okValue: '确定',
        ok: function() {
            this.close().remove();
            if (typeof(okf) == 'function') {
                okf();
            }
        },
        cancelValue: '取消',
        cancel: function() {
            this.close().remove();
        }
    });
    d.showModal();
}

function initLoad() {
    return dialog({
        id: 'loading',
        height: '2em'
    });
}

function startLoad(dial) {
    if (dial) {
        dial = dialog({
            id: 'loading',
            height: '2em'
        });
        dial.showModal();
    } else {
        dial.showModal();
    }

}

function endLoad(dial) {
    if (dial) {
        dial.close();
    }
}