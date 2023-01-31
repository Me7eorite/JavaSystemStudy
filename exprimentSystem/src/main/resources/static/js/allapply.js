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
            {field: 'creator', width: 125, title: '申请人',sort: true},
            {field: 'remarks', width: 125, title: '备注',edit: 'text'},
            {field:'status' ,title: '当前状态', Width: 150, align: "center"},
            {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
        ]],
        limits: [10, 15, 20, 25, 50, 100],
        limit: 15,
        page: true,
        where: {
            status: '申请'
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

    /**
     * toolbar监听事件
     */
    table.on('toolbar(currentTableFilter)', function (obj) {
        if (obj.event === 'add') {  // 监听添加操作
            var index = layer.open({
                title: '添加',
                type: 2,
                shade: 0.2,
                maxmin:true,
                shadeClose: true,
                area: ['100%', '100%'],
                content: '../view/useApply',
            });
            $(window).on("resize", function () {
                layer.full(index);
            });
        } else if (obj.event === 'delete') {  // 监听删除操作
            var checkStatus = table.checkStatus('currentTableId')
                , data = checkStatus.data;
            $.ajax({
                contentType:"content-type=application/json;charset=utf-8",
                url: "../borrow/delete?id="+data.field.id,
                type: "GET"
            });
            // layer.alert(JSON.stringify(data));
        }
    });

    //监听表格复选框选择
    table.on('checkbox(currentTableFilter)', function (obj) {
        console.log(obj)
    });

    table.on('tool(currentTableFilter)', function (obj) {
        var data = obj.data;

        if (obj.event === 'edit') {

            $.ajax({
                url: "../borrow/approve",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify(obj.data)
            });

            $(window).on("resize", function () {
                layer.full(index);
            });
            return false;
        } else if (obj.event === 'delete') {
            layer.confirm('确认驳回', function (index) {
                $.ajax({
                    url: "../borrow/disapprove",
                    type: "GET",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: "tid="+data.tid+"&del="+1
                });
                obj.del();
                layer.close(index);
            });
        }
    });

});