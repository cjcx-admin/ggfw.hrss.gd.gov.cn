function bindHandle(id, handle) {
    if (handle && typeof(handle) == 'object') {
        if (handle.onShow && typeof(handle.onShow) == 'function') {
            $('#' + id).data('onShow', handle.onShow);
        }
        if (handle.onHide && typeof(handle.onHide) == 'function') {
            $('#' + id).data('onHide', handle.onHide);
        }
    }
}

function overlay(id, action) {
    var e1 = document.getElementById(id);
    var visable = e1.style.visibility;
    if (action == 'show') {
        e1.style.visibility = "visible";
        if (visable == 'hidden') {
            var _modal_show = $('#' + id).data('onShow');
            if (_modal_show && typeof(_modal_show) == 'function') {
                _modal_show();
            }
        }
    } else if (action == 'hide') {
        e1.style.visibility = "hidden";
        if (visable == 'visible') {
            var _modal_hide = $('#' + id).data('onHide');
            if (_modal_hide && typeof(_modal_hide) == 'function') {
                _modal_hide();
            }
        }
    }
}

function editModalHeight(id, height) {
    $('#' + id + '>.modal-data').css('height', height + 'px');
    var modalHeight = $('#' + id + '>.modal-data').innerHeight();
    var headerHeight = $('#' + id + '>.modal-data>.modal-head').outerHeight(true);
    var contentHeight = modalHeight - headerHeight;
    $('#' + id + '>.modal-data>.modal-ct').outerHeight(contentHeight + 'px');
    $('#' + id + '>.modal-data>.modal-ct>p').css('height', (contentHeight - 10) + 'px');
}

function editModalHeightPercent(id, height) {
    $('#' + id + '>.modal-data').css('height', height);
    var modalHeight = $('#' + id + '>.modal-data').innerHeight();
    var headerHeight = $('#' + id + '>.modal-data>.modal-head').outerHeight(true);
    var contentHeight = modalHeight - headerHeight;
    $('#' + id + '>.modal-data>.modal-ct').outerHeight(contentHeight + 'px');
    $('#' + id + '>.modal-data>.modal-ct>p').css('height', (contentHeight - 10) + 'px');
}

function editModalWidth(id, width) {
    $('#' + id + '>.modal-data').css('width', width + 'px');
}

function editModalWidthPercent(id, width) {
    $('#' + id + '>.modal-data').css('width', width);
}

function modalDestroy(id) {
    $('#' + id + '>.modal-data>.modal-head .title-box:first-child>font').html('模态框');
    $('#' + id + '>.modal-data>.modal-ct').html('');
    $('#' + id).removeData('onHide');
    $('#' + id).removeData('onShow');
    $('#' + id).removeData('isModal');
}

function alertModalInit(id) {
    modalDestroy(id);
    $('#' + id + '>.modal-data>.modal-head .title-box:first-child>font').html('提&nbsp;示');
    $('#' + id).data('isModal', 'alert');
}

function pageModalInit(id) {
    modalDestroy(id);
    $('#' + id + '>.modal-data>.modal-head .title-box:first-child>font').html('窗&nbsp;口');
    $('#' + id).data('isModal', 'page');
}

function alert_modal(id, option) {
    if (id && typeof(id) == 'string') {
        if ($('#' + id)) {
            if (option) {
                var option_type = typeof(option);
                if (option_type == 'object') {
                    alertModalInit(id);
                    bindHandle(id, option.handle);
                    if (option.height && typeof(option.height) == 'number') {
                        editModalHeight(id, option.height);
                    }
                    if (option.width && typeof(option.width) == 'number') {
                        editModalWidth(id, option.width);
                    }
                    var html = '<p>' + option.content + '</p>';
                    $('#' + id + '>.modal-data>.modal-ct').html(html);
                    overlay(id, 'show');
                } else if (option_type == 'string') {
                    var isModal = $('#' + id).data('isModal');
                    if (isModal && isModal == 'alert') {
                        if (option == 'hide') {
                            overlay(id, 'hide');
                        } else if (option == 'show') {
                            overlay(id, 'show');
                        } else if (option == 'destroy') {
                            modalDestroy(id);
                            return;
                        }
                    }
                }
            }
            $('#' + id + '>.modal-data>.modal-head .close-box>button.close')
                .on('click', function() {
                    overlay(id, 'hide');
                });
        }
    }
}

function page_modal(id, option) {
    if (id && typeof(id) == 'string') {
        if ($('#' + id)) {
            if (option) {
                var option_type = typeof(option);
                if (option_type == 'object') {
                    pageModalInit(id);
                    bindHandle(id, option.handle);

                    if (option.height && typeof(option.height) == 'string') {
                        editModalHeightPercent(id, option.height);
                    } else if (option.height && typeof(option.height) == 'number') {
                        editModalHeight(id, option.height);
                    }
                    if (option.width && typeof(option.width) == 'string') {
                        editModalWidthPercent(id, option.width);
                    } else if (option.width && typeof(option.width) == 'number') {
                        editModalWidth(id, option.width);
                    }
                    if (option.title && typeof(option.title) == 'string') {
                        $('#' + id + '>.modal-data>.modal-head .title-box:first-child>font').html(option.title);
                    }

                    let yiqing2 = document.getElementById('yiqing2');
                    if (option.showClose && option.showClose == 'hide') {
                        //           						document.getElementById('yiqing').hide();
                        if (yiqing2) {
                            yiqing2.innerHTML = "";
                        }
                    } else {
                        if (yiqing2) {
                            yiqing2.innerHTML = "X";
                        }
                    }

                    var url = '';
                    if (option.url) {
                        url = option.url;
                    }
                    var html = '<iframe src="' + url + '" frameborder="0" style="height:100%;width:100%;"></iframe>';
                    $('#' + id + '>.modal-data>.modal-ct').html(html);
                    overlay(id, 'show');
                } else if (option_type == 'string') {
                    var isModal = $('#' + id).data('isModal');
                    if (isModal && isModal == 'page') {
                        if (option == 'hide') {
                            overlay(id, 'hide');
                        } else if (option == 'show') {
                            overlay(id, 'show');
                        } else if (option == 'destroy') {
                            modalDestroy(id);
                            return;
                        }
                    }
                }
            }
            $('#' + id + '>.modal-data>.modal-head .close-box>button.close')
                .on('click', function() {
                    overlay(id, 'hide');
                });
        }
    }
}