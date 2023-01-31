layui.use(['form', 'table'], function () {
    var $ = layui.jquery,
        form = layui.form,
        table = layui.table;

    table.render({
        elem: '#currentTableId',
        url: '../borrow/useCase',
        toolbar: '#toolbarDemo',
        defaultToolbar: ['filter', 'exports', 'print', {
            title: '提示',
            layEvent: 'LAYTABLE_TIPS',
            icon: 'layui-icon-tips'
        }],
        cols: [[
            {type: "checkbox", width: 50},
            {field: 'id', width: 150, title: 'ID'},
            {field: 'type', width: 120, title: '型号',align: "center"},
            {field: 'name', width: 200, title: '名称',align: "center"},
            {field: 'quantity', title: '数量', width: 80,sort: true},
            {field: 'createTime', width: 145, title: '申请时间', sort: true},
            {field: 'endTime', width: 145, title: '预计归还时间'},
            {field: 'creator', width: 125, title: '申请人',sort: true},
            {field:'status' ,title: '当前状态', Width: 150, align: "center"}
        ]],
        limits: [10, 15, 20, 25, 50, 100],
        limit: 15,
        page: true,
        where: {
            status: "使用"
        },
        skin: 'line'
    });

    // 监听搜索操作
    form.on('submit(data-search-btn)', function (data) {
        var result = JSON.stringify(data.field);
        layer.alert(result, {
            title: '最终的搜索信息'
        });

        //执行搜索重载
        table.reload('currentTableId', {
            page: {
                curr: 1
            }
            , where: {
                searchParams: result
            }
        }, 'data');

        return false;
    });
});