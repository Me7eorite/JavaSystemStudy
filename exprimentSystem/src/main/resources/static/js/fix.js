layui.use(['form', 'table'], function () {
    var $ = layui.jquery,
        form = layui.form,
        table = layui.table;

    table.render({
        elem: '#currentTableId',
        url: '../device/allfix',
        toolbar: '#toolbarDemo',
        defaultToolbar: ['filter', 'exports', 'print', {
            title: '提示',
            layEvent: 'LAYTABLE_TIPS',
            icon: 'layui-icon-tips'
        }],
        cols: [[
            {type: "checkbox", width: 50},
            {field: 'tid', width: 150, title: 'ID'},
            {field: 'type', width: 150, title: '型号',align: "center"},
            {field: 'name', width: 200, title: '名称',align: "center"},
            {field: 'unitPrice', width: 80, title: '单价',sort: true},
            {field: 'totally', title: '数量', width: 80,sort: true},
            {field: 'createTime', width: 145, title: '购买时间', sort: true},
            {field: 'creator', width: 125, title: '经办人',sort: true},
        ]],
        limits: [10, 15, 20, 25, 50, 100],
        limit: 15,
        page: true,
        skin: 'line'
    });


});